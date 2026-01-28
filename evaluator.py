import os
import subprocess
import csv
import re

def analyze_signature(asm_content):
    if "malloc" in asm_content.lower():
        return "TYPE_MALLOC_DATA"
    if "l_.str" in asm_content:
        return "TYPE_STRING_LOGIC"
    return "TYPE_GENERAL"

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []

    if not os.path.exists(asm_dir):
        return

    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        with open(asm_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        sig_type = analyze_signature(content)
        exe_name = f"./test_{filename}.out"
        
        # 编译指令：移除 ASAN (如果你不需要深度调试)，或保留但增强解码
        compile_cmd = (
            f"clang -arch arm64 -O0 -g "
            f"-fsanitize=address " 
            f"\"{harness}\" \"{asm_path}\" "
            f"-o {exe_name} -lm -lc"
        )
        
        # 编译阶段
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True)
        
        res = {"file": filename, "type": sig_type, "compile": "FAIL", "run": "SKIP", "error_log": ""}

        if cp.returncode == 0:
            res["compile"] = "OK"
            try:
                # --- 关键修改：去掉 text=True ---
                rp = subprocess.run(exe_name, shell=True, capture_output=True, timeout=2.0)
                
                # 安全解码 stdout 和 stderr
                stdout_str = rp.stdout.decode('utf-8', errors='ignore')
                stderr_str = rp.stderr.decode('utf-8', errors='ignore')

                if rp.returncode == 0:
                    res["run"] = "OK"
                else:
                    res["run"] = f"CRASH({rp.returncode})"
                    res["error_log"] = stderr_str
            except subprocess.TimeoutExpired:
                res["run"] = "TIMEOUT"
        else:
            res["error_log"] = cp.stderr.decode('utf-8', errors='ignore')

        results.append(res)
        print(f"{filename:<25} | {res['compile']:<8} | {res['run']:<8}")

        if os.path.exists(exe_name):
            os.remove(exe_name)

    # 保存报告
    with open("detailed_report.csv", "w", newline="", encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=["file", "type", "compile", "run", "error_log"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()