import os
import subprocess
import csv

def analyze_signature(asm_content):
    """
    基于指令特征和寄存器使用的智能识别系统
    """
    # 1. 识别字符串返回模式 (核心特征: adrp 指向 l_.str 且有返回逻辑)
    if "l_.str" in asm_content and ("adrp" in asm_content or "ret" in asm_content):
        return "TYPE_STR_RETURN"
    
    # 2. 识别多参数复合模式 (特征: 同时使用 x2, x3 或 [x29, #-24])
    if ("x2" in asm_content and "x3" in asm_content) or ("[x29, #-24]" in asm_content):
        return "TYPE_MULTIPARAM"
    
    # 3. 识别动态内存分配
    if "bl _malloc" in asm_content or "bl malloc" in asm_content:
        return "TYPE_MALLOC"
    
    # 4. 识别浮点运算 (s0, d0 寄存器或 f-开头的指令)
    float_indicators = ["fadd", "fsub", "fmul", "fcmp", "fcvt", "s0", "d0"]
    if any(ind in asm_content.lower() for ind in float_indicators):
        return "TYPE_FLOAT"
    
    # 5. 默认通用模式
    return "TYPE_GENERAL"

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []
    
    if not os.path.exists(asm_dir):
        print(f"Error: {asm_dir} missing.")
        return

    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])
    print(f"{'FILENAME':<25} | {'SIG_TYPE':<15} | {'COMPILE':<8} | {'RUN':<8}")
    print("-" * 75)

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        with open(asm_path, 'r', encoding='utf-8') as f:
            content = f.read()

        sig_type = analyze_signature(content)
        exe_name = f"./temp_{filename}.out"
        
        row = {"file": filename, "type": sig_type, "compile": "FAIL", "run": "SKIP", "error_log": ""}

        # 编译阶段：加上 -lm 处理数学库，-arch arm64 确保 macOS 环境正确
        compile_cmd = f"clang -arch arm64 -O0 -D{sig_type} {harness} {asm_path} -o {exe_name} -lm"
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True, text=True)

        if cp.returncode == 0:
            row["compile"] = "OK"
            # 运行阶段：严格的 1.5 秒超时保护
            try:
                rp = subprocess.run(exe_name, shell=True, capture_output=True, text=True, timeout=1.5)
                if rp.returncode == 0:
                    row["run"] = "OK"
                else:
                    row["run"] = f"CRASH({rp.returncode})"
                    row["error_log"] = rp.stderr
            except subprocess.TimeoutExpired:
                row["run"] = "TIMEOUT"
        else:
            row["error_log"] = cp.stderr

        print(f"{filename:<25} | {sig_type:<15} | {row['compile']:<8} | {row['run']:<8}")
        results.append(row)
        
        if os.path.exists(exe_name):
            os.remove(exe_name)

    # 导出详细 CSV 报告
    with open("detailed_report.csv", "w", newline="", encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=["file", "type", "compile", "run", "error_log"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()