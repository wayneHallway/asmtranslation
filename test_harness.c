#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

extern uintptr_t func0(uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t, uintptr_t);

int main() {
    // 1. 分配安全内存池
    const size_t pool_size = 1024 * 1024; // 1MB 足够了
    void* big_pool = calloc(pool_size, 1);
    uintptr_t safe_ptr = (uintptr_t)big_pool + 512 * 1024;

    /**
     * 关键修改：
     * x0: 传一个合理的小整数（如 100）。如果它是长度，循环 100 次很快；
     * 如果它是指针，100 会触发 Crash，没关系，我们在 Python 里捕获。
     * x1-x7: 传安全指针，用于承载数组首地址。
     */
    printf("[Harness] Probing with balanced parameters...\n");
    
    // 第一次尝试：假设 x0 是长度，x1 是指针
    uintptr_t result = func0(100, safe_ptr, safe_ptr, safe_ptr, safe_ptr, safe_ptr, safe_ptr, safe_ptr);

    printf("[RESULT] Returned: 0x%lx\n", (unsigned long)result);
    return 0;
}