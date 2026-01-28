import os
import subprocess
import csv

def analyze_signature(asm_content):
    """
    保持你原有的逻辑，但增加对浮点指令的敏感度
    """
    # 浮点指令特征（ARM64）
    float_indicators = ["fadd", "fsub", "fmul", "fcmp", "s0", "d0", "v0"]
    if any(ind in asm_content.lower() for ind in float_indicators):
        return "TYPE_FLOAT"
    
    if "l_.str" in asm_content:
        return "TYPE_STR_RETURN"
    
    # 默认通用模式
    return "TYPE_GENERAL"

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []

    if not os.path.exists(asm_dir): return

    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        with open(asm_path, 'r', encoding='utf-8') as f:
            content = f.read()

        sig_type = analyze_signature(content)
        exe_name = f"./{filename}.out"
        
        # 关键点：使用 -D 传入类型，并加入 Address Sanitizer (asan)
        # asan 能在运行时告诉你到底哪里越界了，非常适合论文的数据分析
        compile_cmd = (
            f"clang -arch arm64 -O0 -g "
            f"-fsanitize=address "  # 开启内存安全检测
            f"-D{sig_type} "        # 告诉 C 代码现在是什么模式
            f"{harness} {asm_path} "
            f"-o {exe_name} -lm"
        )
        
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True, text=True)

        res_entry = {"file": filename, "type": sig_type, "compile": "FAIL", "run": "SKIP"}

        if cp.returncode == 0:
            res_entry["compile"] = "OK"
            try:
                # 运行测试
                rp = subprocess.run(exe_name, shell=True, capture_output=True, text=True, timeout=2.0)
                if rp.returncode == 0:
                    res_entry["run"] = "OK"
                else:
                    res_entry["run"] = f"CRASH({rp.returncode})"
            except subprocess.TimeoutExpired:
                res_entry["run"] = "TIMEOUT"
        
        results.append(res_entry)
        print(f"{filename:<25} | {sig_type:<15} | {res_entry['compile']:<8} | {res_entry['run']:<8}")

        if os.path.exists(exe_name): os.remove(exe_name)

    # 导出报告
    with open("detailed_report.csv", "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["file", "type", "compile", "run"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()