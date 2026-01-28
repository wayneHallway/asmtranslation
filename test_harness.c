#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 声明 8 个参数，强迫 C 编译器填满 x0-x7
extern uintptr_t func0(uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t);

int main() {
    // 1. 分配一个巨大的内存池（16MB），确保汇编随便怎么乱跳都不会出界
    const size_t pool_size = 16 * 1024 * 1024;
    void* big_pool = calloc(pool_size, 1);
    
    // 让指针指向池子的中间，这样汇编代码往前、往后偏移几百 KB 都是安全的
    uintptr_t p = (uintptr_t)big_pool + (pool_size / 2);

    // 2. 极限填充：所有 8 个参数全部塞入这个安全指针
    // 这样无论模型预期 x0 是数组、x1 是长度、还是 x2 是结果缓冲区，
    // 它们现在全都是合法的内存地址。
    printf("[Harness] Universal Probe Start...\n");
    
    uintptr_t res = func0(p, 100, p, 100, p, 100, p, 100);

    // 3. 简单的结果判定
    if (res > 0) {
        printf("[RESULT] Return: 0x%lx\n", (unsigned long)res);
    }

    // 故意不 free(big_pool)，防止模型代码写坏了内存头导致 free 时崩溃
    printf("[Harness] Success.\n");
    return 0;
}