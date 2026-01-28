#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/**
 * 核心：这是唯一且最终的声明。
 * 在 macOS 下，C 语言调用 func0，链接器会自动去找汇编里的 _func0。
 * 我们声明 8 个参数，确保 ARM64 的 x0-x7 寄存器全部被 C 语言填入安全值。
 */
extern uintptr_t func0(
    uintptr_t x0, uintptr_t x1, uintptr_t x2, uintptr_t x3, 
    uintptr_t x4, uintptr_t x5, uintptr_t x6, uintptr_t x7
);

int main() {
    // 准备安全内存池，所有指针参数都指向这里，有效防止汇编越界导致的 Crash
    void* safe_pool = calloc(8192, 1); 
    uintptr_t p = (uintptr_t)safe_pool;

    // 预填一些测试数据到内存池里，万一汇编要读数据呢
    uint32_t* data = (uint32_t*)safe_pool;
    for(int i=0; i<100; i++) data[i] = i;

    printf("[Harness] Execution Start...\n");

    /**
     * 不管你的 .s 实际上需要几个参数，
     * 我们通过这个调用，一次性把 x0 到 x7 全部塞满。
     * 汇编代码只会按需取它需要的寄存器，多余的会被静默忽略。
     */
    uintptr_t res = func0(p, 10, p, 10, p, 10, p, 10);

    // 根据外部传入的编译宏打印结果
    #ifdef TYPE_STR_RETURN
        // 简单判断返回值是否像一个有效的字符串指针
        if (res > 0x100000000) printf("[RESULT] String: %s\n", (char*)res);
    #else
        printf("[RESULT] Value: %lu\n", (unsigned long)res);
    #endif

    printf("[Harness] Execution Finished.\n");
    free(safe_pool);
    return 0;
}