import json
import os
import re
import subprocess
import ast

def python_to_c_arg(node):
    """
    将 Python 的 AST 节点转换为 C 语言代码和对应的寄存器占用数量
    """
    if isinstance(node, ast.Constant):
        val = node.value
        if isinstance(val, str):
            return {"code": f'"{val}"', "type": "ptr", "regs": 1}
        if isinstance(val, bool):
            return {"code": "1" if val else "0", "type": "int", "regs": 1}
        return {"code": str(val), "type": "num", "regs": 1}
    
    if isinstance(node, ast.List):
        elements = [str(n.value) if isinstance(n, ast.Constant) else "0" for n in node.elts]
        if not elements:
            return {"code": "NULL, 0", "type": "array", "regs": 2}
        array_content = "{" + ", ".join(elements) + "}"
        return {"code": array_content, "len": len(elements), "type": "array", "regs": 2}
    
    return {"code": "0", "type": "unknown", "regs": 1}

def generate_harness(task_id, entry_point, test_code):
    """
    解析 test 字符串，动态生成 C 代码
    """
    pattern = rf"assert {entry_point}\((.*?)\)\s*==\s*(.*)"
    matches = re.findall(pattern, test_code)
    
    test_cases_c = ""
    for i, (args_raw, expected_raw) in enumerate(matches):
        try:
            parsed_args = ast.parse(f"({args_raw})").body[0].value.elts
        except:
            parsed_args = [ast.parse(args_raw).body[0].value]

        c_setup = f"    // Test Case {i}\n    {{\n"
        call_params = []
        
        for idx, arg_node in enumerate(parsed_args):
            info = python_to_c_arg(arg_node)
            if info["type"] == "array":
                c_setup += f"        double arr_{i}_{idx}[] = {info['code']};\n"
                call_params.append(f"(uintptr_t)arr_{i}_{idx}")
                call_params.append(str(info["len"]))
            else:
                call_params.append(info["code"])

        while len(call_params) < 8:
            call_params.append("0")

        expected_val = expected_raw.strip()
        if expected_val == "True": expected_val = "1"
        elif expected_val == "False": expected_val = "0"

        c_test = f"{c_setup}        if (func0({', '.join(call_params)}) != (uintptr_t){expected_val}) return {i+1};\n    }}\n"
        test_cases_c += c_test

    return f"""
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

extern uintptr_t func0(uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t);

int main() {{
{test_cases_c}
    printf("SUCCESS\\n");
    return 0;
}}
"""

def run_evaluation():
    jsonl_file = "human-eval-v2-20210705.jsonl"
    if not os.path.exists(jsonl_file):
        print(f"Error: {jsonl_file} not found.")
        return

    with open(jsonl_file, 'r') as f:
        tasks = [json.loads(line) for line in f]
    
    asm_dir = "./generated_asm"
    if not os.path.exists(asm_dir):
        print(f"Error: Directory {asm_dir} not found.")
        return

    asm_files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")], 
                       key=lambda x: int(re.search(r'\d+', x).group()))

    # --- 统计计数器 ---
    total_files = len(asm_files)
    compile_success_count = 0  # 编译成功数
    passed_count = 0           # 逻辑通过数 (OK)
    fail_count = 0             # 逻辑失败数
    crash_count = 0            # 崩溃或超时数
    compile_error_count = 0    # 编译失败数

    print(f"开始评测: 共找到 {total_files} 个汇编文件\n" + "-"*50)

    for i, filename in enumerate(asm_files):
        if i >= len(tasks):
            break
            
        task = tasks[i]
        harness = generate_harness(task['task_id'], task['entry_point'], task['test'])
        
        with open("temp_harness.c", "w") as f:
            f.write(harness)
        
        asm_path = os.path.join(asm_dir, filename)
        compile_cmd = f"clang -arch arm64 temp_harness.c {asm_path} -o tester -lm"
        
        # 尝试编译
        if subprocess.run(compile_cmd, shell=True, capture_output=True).returncode == 0:
            compile_success_count += 1 # 编译成功计数
            try:
                # 尝试运行
                res = subprocess.run("./tester", capture_output=True, text=True, timeout=2)
                if "SUCCESS" in res.stdout:
                    print(f"Task {i:<3} ({filename:<10}): [OK]")
                    passed_count += 1
                else:
                    print(f"Task {i:<3} ({filename:<10}): [FAIL] at Case {res.returncode}")
                    fail_count += 1
            except subprocess.TimeoutExpired:
                print(f"Task {i:<3} ({filename:<10}): [TIMEOUT]")
                crash_count += 1
            except Exception:
                print(f"Task {i:<3} ({filename:<10}): [CRASH]")
                crash_count += 1
        else:
            print(f"Task {i:<3} ({filename:<10}): [COMPILE ERROR]")
            compile_error_count += 1

    # --- 统计输出逻辑 ---
    print("-" * 50)
    print("评测结束汇总报告:")
    print(f"1. 样本总数:      {total_files}")
    print(f"2. 编译阶段:      成功 {compile_success_count} / 失败 {compile_error_count}")
    print(f"3. 执行阶段:      通过 {passed_count} / 逻辑错误 {fail_count} / 崩溃超时 {crash_count}")
    print("-" * 50)
    
    if total_files > 0:
        # 编译通过率：编译成功的 / 总数
        compile_rate = (compile_success_count / total_files) * 100
        # 执行通过率：执行通过的(OK) / 编译成功的 (只有编译成功了才有资格谈执行通过率)
        exec_rate = (passed_count / compile_success_count * 100) if compile_success_count > 0 else 0
        # 整体通过率：执行通过的(OK) / 总数
        overall_rate = (passed_count / total_files) * 100

        print(f"编译通过率 (Compile Success Rate): {compile_rate:.2f}%")
        print(f"执行通过率 (Execution Pass Rate):  {exec_rate:.2f}% (基于已编译成功的样本)")
        print(f"最终全通过率 (Full Pass Rate):      {overall_rate:.2f}%")
    else:
        print("未发现有效样本。")
    print("-" * 50)

    if os.path.exists("tester"): os.remove("tester")
    if os.path.exists("temp_harness.c"): os.remove("temp_harness.c")

if __name__ == "__main__":
    run_evaluation()