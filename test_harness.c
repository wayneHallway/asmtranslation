#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * 适配模式说明：
 * 1. TYPE_STR_RETURN: 返回 char* (如 "YES"/"NO")，接收 4 个参数 (int*, int, int*, int)
 * 2. TYPE_MULTIPARAM: 接收 4 个参数 (int*, int, int**, int*)，用于排序/过滤
 * 3. TYPE_MALLOC:     接收 1 个参数 (int n)，返回 int*
 * 4. TYPE_FLOAT:      接收 3 个参数 (float*, int, float)
 * 5. TYPE_GENERAL:    通用探测模式 (void*, int)
 */

#ifdef TYPE_STR_RETURN
    extern char* func0(int* a, int na, int* b, int nb);
#elif defined(TYPE_MULTIPARAM)
    extern void func0(int* input, int n, int** output_ptr, int* count_ptr);
#elif defined(TYPE_MALLOC)
    extern int* func0(int n);
#elif defined(TYPE_FLOAT)
    extern int func0(float* arr, int n, float threshold);
#else
    extern int func0(void* buf, int n);
#endif

int main() {
    printf("[Harness] Execution Start...\n");

#ifdef TYPE_STR_RETURN
    int a[5] = {2, 4, 6, 8, 10};
    int b[5] = {1, 3, 5, 7, 9};
    char* res = func0(a, 5, b, 5);
    if (res) printf("[Harness] Result String: %s\n", res);

#elif defined(TYPE_MULTIPARAM)
    int in_data[5] = {50, 40, 30, 20, 10};
    int* out_ptr = NULL;
    int count = 0;
    func0(in_data, 5, &out_ptr, &count);
    printf("[Harness] Multi-Param OK, Count: %d\n", count);
    if (out_ptr) free(out_ptr);

#elif defined(TYPE_MALLOC)
    int n = 16;
    int* res = func0(n);
    if (res) { printf("[Harness] Malloc Pointer: %p\n", res); free(res); }

#elif defined(TYPE_FLOAT)
    float fdata[5] = {1.1f, 2.2f, 3.3f, 4.4f, 5.5f};
    int fres = func0(fdata, 5, 0.5f);
    printf("[Harness] Float Result: %d\n", fres);

#else
    // 通用安全模式：分配大缓冲区并清零，防止非法地址读写
    void* buffer = calloc(1024 * 1024, 1); 
    int gres = func0(buffer, 10);
    printf("[Harness] General Return: %d\n", gres);
    free(buffer);
#endif

    printf("[Harness] Execution Finished.\n");
    return 0;
}