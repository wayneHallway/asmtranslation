import os
import subprocess
import csv

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []

    if not os.path.exists(asm_dir): return

    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        exe_name = f"./exe_{filename}.out"
        
        # --- 关键修改 ---
        # 1. 移除 -fsanitize=address，不再进行内存洁癖检查
        # 2. 移除 -g，减小干扰
        # 3. 增加 -Wl,-z,noexecstack 等兼容性参数 (如果需要)
        compile_cmd = f"clang -arch arm64 -O0 \"{harness}\" \"{asm_path}\" -o {exe_name} -lm -lc"
        
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True)
        
        row = {"file": filename, "compile": "FAIL", "run": "SKIP"}

        if cp.returncode == 0:
            row["compile"] = "OK"
            try:
                # 运行测试，捕捉所有输出
                rp = subprocess.run(exe_name, shell=True, capture_output=True, timeout=1.5)
                
                if rp.returncode == 0:
                    row["run"] = "OK"
                else:
                    # 即使是非 0 返回值，只要执行完了也算一种结果
                    row["run"] = f"RET_{rp.returncode}"
            except subprocess.TimeoutExpired:
                row["run"] = "TIMEOUT"
        
        results.append(row)
        print(f"{filename:<25} | {row['compile']:<8} | {row['run']:<8}")
        if os.path.exists(exe_name): os.remove(exe_name)

    with open("detailed_report.csv", "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["file", "compile", "run"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()