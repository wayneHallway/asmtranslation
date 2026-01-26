import os
import subprocess
import time
import csv

def run_detailed_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    
    # 统计初始化
    results = []
    stats = {"total": 0, "compile_ok": 0, "run_ok": 0}
    
    if not os.path.exists(asm_dir):
        print("Error: generated_asm folder missing!")
        return

    files = sorted([f for f in os.listdir(asm_dir) if f.endswith(".s")])
    stats["total"] = len(files)

    print(f"{'FILE':<30} | {'COMPILE':<10} | {'EXECUTE':<10}")
    print("-" * 55)

    for filename in files:
        asm_path = os.path.join(asm_dir, filename)
        exe_name = f"./temp_{filename}.out"
        
        status = {"file": filename, "compile": "FAIL", "run": "SKIP", "error": ""}

        # 1. 编译阶段 (指定 arm64 架构)
        # 注意：这里加入了 -lm 链接数学库，防止你的汇编调用了 sqrt 等函数
        cmd_compile = f"clang -arch arm64 -O0 {harness} {asm_path} -o {exe_name} -lm"
        cp = subprocess.run(cmd_compile, shell=True, capture_output=True, text=True)
        
        if cp.returncode == 0:
            status["compile"] = "OK"
            stats["compile_ok"] += 1
            
            # 2. 执行阶段 (加入 2 秒超时防止死循环)
            try:
                rp = subprocess.run(exe_name, shell=True, capture_output=True, text=True, timeout=2)
                if rp.returncode == 0:
                    status["run"] = "OK"
                    stats["run_ok"] += 1
                else:
                    status["run"] = f"FAIL({rp.returncode})"
                    status["error"] = rp.stderr
            except subprocess.TimeoutExpired:
                status["run"] = "TIMEOUT"
        else:
            status["error"] = cp.stderr

        # 打印实时明细
        print(f"{filename:<30} | {status['compile']:<10} | {status['run']:<10}")
        results.append(status)
        
        # 清理临时文件
        if os.path.exists(exe_name): os.remove(exe_name)

    # 保存明细到 CSV
    with open("detailed_results.csv", "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["file", "compile", "run", "error"])
        writer.writeheader()
        writer.writerows(results)

    # 打印总报表
    report = f"""
==================================================
        GG EVALUATION FINAL SUMMARY
==================================================
TOTAL FILES      : {stats['total']}
COMPILE SUCCESS  : {stats['compile_ok']} ({(stats['compile_ok']/stats['total'])*100:.1f}%)
EXECUTE SUCCESS  : {stats['run_ok']} ({(stats['run_ok']/stats['total'])*100:.1f}%)
==================================================
    """
    print(report)
    with open("quantitative_report.txt", "w") as f: f.write(report)

if __name__ == "__main__":
    run_detailed_evaluation()