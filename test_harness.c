#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

// 统一的外部声明
extern uintptr_t func0(uintptr_t x0, uintptr_t x1, uintptr_t x2, uintptr_t x3, 
                       uintptr_t x4, uintptr_t x5, uintptr_t x6, uintptr_t x7);

int main(int argc, char** argv) {
    if (argc < 2) return 1;
    int mode = atoi(argv[1]);

    // 准备一个 8MB 的安全内存大后方
    const size_t pool_size = 8 * 1024 * 1024;
    void* big_pool = calloc(pool_size, 1);
    uintptr_t safe_ptr = (uintptr_t)big_pool + (pool_size / 2);

    // 填充一些基础数据
    uint32_t* d = (uint32_t*)big_pool;
    for(int i=0; i<1000; i++) d[i] = i;

    if (mode == 1) {
        /* 方案 A：针对指针类函数
           x0 传地址，x1 传小规模长度
        */
        func0(safe_ptr, 100, safe_ptr, 100, safe_ptr, 100, safe_ptr, 100);
    } 
    else if (mode == 2) {
        /* 方案 B：针对数值循环类函数 (解决你给出的那个 Timeout 例子)
           x0 传小整数，x1 传地址
        */
        func0(100, safe_ptr, safe_ptr, safe_ptr, safe_ptr, safe_ptr, safe_ptr, safe_ptr);
    }

    // 打印唯一成功标记
    printf("EXECUTION_SUCCESS_SIGNAL\n");
    
    // 不释放内存以防模型损坏了堆结构导致 free 崩溃
    return 0;
}