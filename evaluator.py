import os
import subprocess
import csv

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []
    
    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])
    total_count = len(files)
    ok_count = 0

    print(f"{'FILENAME':<30} | {'MODE 1':<8} | {'MODE 2':<8} | {'FINAL'}")
    print("-" * 65)

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        exe_name = f"./exe_{filename}.out"
        
        # 编译命令：链接标准库，不带 ASAN (追求最高运行兼容性)
        compile_cmd = f"clang -arch arm64 -O0 \"{harness}\" \"{asm_path}\" -o {exe_name} -lm -lc"
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True)
        
        mode1_res = "FAIL"
        mode2_res = "FAIL"
        passed = False

        if cp.returncode == 0:
            # --- 第一轮尝试：指针优先 (Mode 1) ---
            try:
                rp1 = subprocess.run([exe_name, "1"], capture_output=True, text=True, timeout=1.0)
                if "EXECUTION_SUCCESS_SIGNAL" in rp1.stdout:
                    mode1_res = "OK"
                    passed = True
            except subprocess.TimeoutExpired:
                mode1_res = "TIMEOUT"

            # --- 如果第一轮没过，启动第二轮尝试：数值优先 (Mode 2) ---
            if not passed:
                try:
                    rp2 = subprocess.run([exe_name, "2"], capture_output=True, text=True, timeout=1.0)
                    if "EXECUTION_SUCCESS_SIGNAL" in rp2.stdout:
                        mode2_res = "OK"
                        passed = True
                except subprocess.TimeoutExpired:
                    mode2_res = "TIMEOUT"

        final_status = "OK" if passed else "FAILED"
        if passed: ok_count += 1
        
        print(f"{filename:<30} | {mode1_res:<8} | {mode2_res:<8} | {final_status}")
        results.append({"file": filename, "status": final_status})
        
        if os.path.exists(exe_name):
            os.remove(exe_name)

    # 打印最终统计摘要
    print("\n" + "="*40)
    print(f"  TOTAL FILES: {total_count}")
    print(f"  SUCCESSFUL:  {ok_count}")
    print(f"  PASS RATE:   {ok_count/total_count*100:.1f}%")
    print("="*40)

    # 导出 CSV 报告
    with open("detailed_report.csv", "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["file", "status"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()