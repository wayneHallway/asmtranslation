#include <stdio.h>

// 严格匹配：x0=数组指针, w1=长度, s0=浮点阈值
// 返回值：w0=整数状态
extern int func0(float *arr, int len, float threshold);

int main() {
    float data[3] = {1.0f, 2.0f, 3.0f};
    // 这里的参数要能触发汇编里的逻辑分支
    int res = func0(data, 3, 0.1f); 
    
    printf("Result: %d\n", res);
    return 0;
}