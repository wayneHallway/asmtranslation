#include <stdio.h>
#include <stdlib.h>

#ifdef TYPE_STR_RETURN
    // 针对返回 "YES"/"NO" 指针的函数
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
    printf("[Harness] Start...\n");

#ifdef TYPE_STR_RETURN
    int a[3] = {2, 4, 6};
    int b[3] = {1, 3, 5};
    char* res = func0(a, 3, b, 3);
    // 打印指针指向的内容，而不是指针数值
    if (res) printf("[Harness] String Return: %s\n", res);

#elif defined(TYPE_MULTIPARAM)
    int in[3] = {1, 2, 3}; int* out = NULL; int c = 0;
    func0(in, 3, &out, &c);
    printf("[Harness] Multi-param OK\n");
    if (out) free(out);

// ... 其他模式保留 (TYPE_MALLOC, TYPE_FLOAT, TYPE_GENERAL) ...
#endif

    printf("[Harness] End.\n");
    return 0;
}