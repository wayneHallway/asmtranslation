import os
import subprocess
import csv

def analyze_signature(asm_content):
    """
    只读探测：通过汇编关键词判断该给 C 语言传什么打印宏
    """
    if "l_.str" in asm_content:
        return "TYPE_STR_RETURN"
    # 可以根据需要增加其他探测逻辑
    return "TYPE_GENERAL"

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []

    if not os.path.exists(asm_dir):
        print("Error: Directory not found")
        return

    # 排序处理，保证结果顺序一致
    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        
        # 只读方式打开，绝不修改
        with open(asm_path, 'r', encoding='utf-8') as f:
            content = f.read()

        sig_type = analyze_signature(content)
        exe_name = f"./temp_exe_{filename}.out"
        
        # 编译命令：直接链接你的 .s 文件
        # -Wl,-no_pie 可以解决某些 Mac 环境下的地址随机化干扰
        compile_cmd = (
            f"clang -arch arm64 -O0 "
            f"-D{sig_type} "
            f"{harness} \"{asm_path}\" "
            f"-o {exe_name} -lm"
        )
        
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True, text=True)

        row = {"file": filename, "type": sig_type, "compile": "FAIL", "run": "SKIP", "log": ""}

        if cp.returncode == 0:
            row["compile"] = "OK"
            try:
                # 运行阶段
                rp = subprocess.run(exe_name, shell=True, capture_output=True, text=True, timeout=1.5)
                if rp.returncode == 0:
                    row["run"] = "OK"
                else:
                    row["run"] = f"CRASH({rp.returncode})"
                    row["log"] = rp.stderr
            except subprocess.TimeoutExpired:
                row["run"] = "TIMEOUT"
        else:
            row["log"] = cp.stderr

        print(f"{filename:<25} | {sig_type:<15} | {row['compile']:<8} | {row['run']:<8}")
        results.append(row)

        if os.path.exists(exe_name):
            os.remove(exe_name)

    # 写入 CSV
    with open("detailed_report.csv", "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["file", "type", "compile", "run", "log"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()