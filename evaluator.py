import os
import subprocess
import csv

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    results = []
    stats = {"total": 0, "ok": 0, "fail": 0, "timeout": 0}

    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])
    stats["total"] = len(files)

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        exe_name = f"./exe_{filename}.out"
        
        # 编译
        compile_cmd = f"clang -arch arm64 -O0 \"{harness}\" \"{asm_path}\" -o {exe_name} -lm -lc"
        cp = subprocess.run(compile_cmd, shell=True, capture_output=True)
        
        status = "COMPILE_FAIL"
        if cp.returncode == 0:
            try:
                # 运行，增加到 2 秒，给循环留点空间
                rp = subprocess.run(exe_name, shell=True, capture_output=True, timeout=2.0)
                if rp.returncode == 0:
                    status = "OK"
                    stats["ok"] += 1
                else:
                    status = f"CRASH_{rp.returncode}"
                    stats["fail"] += 1
            except subprocess.TimeoutExpired:
                status = "TIMEOUT"
                stats["timeout"] += 1
        else:
            stats["fail"] += 1

        print(f"{filename:<30} | {status}")
        results.append({"file": filename, "status": status})
        if os.path.exists(exe_name): os.remove(exe_name)

    # 打印最终统计
    print("\n" + "="*40)
    print(f"TOTAL: {stats['total']}")
    print(f"OK:    {stats['ok']} ({stats['ok']/stats['total']*100:.1f}%)")
    print(f"FAIL:  {stats['fail']}")
    print(f"TIMEOUT: {stats['timeout']}")
    print("="*40)

    with open("detailed_report.csv", "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["file", "status"])
        writer.writeheader()
        writer.writerows(results)

if __name__ == "__main__":
    run_evaluation()