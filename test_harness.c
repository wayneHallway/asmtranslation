#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/**
 * 核心逻辑：
 * 汇编里的 _func0 不知道 C 语言是怎么声明它的。
 * 它只管从 x0, x1, x2... 寄存器里拿值。
 * 我们通过这个“万能签名”，强制 C 编译器把这 8 个寄存器全部填满。
 */
extern uintptr_t func0(
    uintptr_t x0, uintptr_t x1, uintptr_t x2, uintptr_t x3, 
    uintptr_t x4, uintptr_t x5, uintptr_t x6, uintptr_t x7
);

/**
 * 浮点专用：如果你的 analyze_signature 判定是浮点运算，
 * 汇编会去 s0/d0 寄存器拿值。上面的整数签名填不进浮点寄存器。
 */
extern double func0_float(double d0, double d1, double d2, double d3);

int main(int argc, char **argv) {
    // 准备一个 4KB 的安全内存池，所有指针参数都指向这里，防止非法内存访问
    void* safe_pool = calloc(4096, 1);
    uintptr_t p = (uintptr_t)safe_pool;

    // 获取当前文件的评测类型（由 evaluator.py 在编译时通过 -D 传入）
    #if defined(TYPE_FLOAT)
        printf("[Harness] Floating Point Mode\n");
        double f_res = func0_float(1.0, 2.0, 3.0, 4.0);
        printf("[RESULT] %f\n", f_res);

    #elif defined(TYPE_STR_RETURN)
        printf("[Harness] String Return Mode\n");
        // 即使它只要 2 个参数，我们也填满 8 个，确保 x0-x7 都有值
        uintptr_t s_res = func0(p, 10, p, 10, p, 10, p, 10);
        if (s_res > 0x1000) { // 简单的有效指针判断
            printf("[RESULT] %s\n", (char*)s_res);
        }

    #else
        // 通用模式：涵盖了 MULTIPARAM, MALLOC, GENERAL
        printf("[Harness] General/Multi-Param Mode\n");
        uintptr_t res = func0(p, 10, p, 10, p, 10, p, 10);
        printf("[RESULT] %lu\n", (unsigned long)res);
    #endif

    free(safe_pool);
    return 0;
}