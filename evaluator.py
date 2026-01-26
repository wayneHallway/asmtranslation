import os
import subprocess

def run_evaluation():
    asm_dir = "./generated_asm"
    harness = "test_harness.c"
    log_file = "evaluation_log.txt"
    
    if not os.path.exists(asm_dir):
        print(f"Error: Directory {asm_dir} not found.")
        return

    files = [f for f in os.listdir(asm_dir) if f.endswith(".s")]
    print(f"Found {len(files)} assembly files. Starting evaluation...")

    with open(log_file, "w") as log:
        for filename in sorted(files):
            asm_path = os.path.join(asm_dir, filename)
            exe_name = f"./bin_{filename}.out"

            log.write(f"Testing {filename}...\n")
            print(f"[{filename}] Compiling...", end=" ")

            # 1. 使用 Apple Clang 编译，开启覆盖率统计标志
            # -fprofile-arcs -ftest-coverage 必须加，否则没覆盖率数据
            compile_cmd = f"clang -O0 {harness} {asm_path} -o {exe_name} -fprofile-arcs -ftest-coverage"
            c_res = subprocess.run(compile_cmd, shell=True, capture_output=True, text=True)

            if c_res.returncode != 0:
                print("FAIL (Compile Error)")
                log.write(f"Compile Error:\n{c_res.stderr}\n")
                continue

            # 2. 运行二进制文件
            print("Running...", end=" ")
            r_res = subprocess.run(exe_name, shell=True, capture_output=True, text=True)

            if r_res.returncode == 0:
                print("SUCCESS")
                log.write(f"Execution Output:\n{r_res.stdout}\n")
                
                # 3. 统计覆盖率 (生成 .gcov 文件)
                # xcrun llvm-cov gcov 是 Mac 上对应 gcov 的工具
                subprocess.run(f"xcrun llvm-cov gcov {asm_path}", shell=True, capture_output=True)
            else:
                print(f"CRASHED (Exit Code: {r_res.returncode})")
                log.write(f"Runtime Error (Exit Code {r_res.returncode}):\n{r_res.stderr}\n")

    print("\nEvaluation finished. Check 'evaluation_log.txt' for details.")

if __name__ == "__main__":
    run_evaluation()