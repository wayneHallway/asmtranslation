#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 声明外部汇编函数。
// 注意：虽然汇编里是 _func0，但在 C 里只需写 func0
extern void func0(char *s1, char *s2);

void print_hex(const char *label, const char *s, int len) {
    printf("%s (Hex): ", label);
    for (int i = 0; i < len; i++) {
        printf("%02x ", (unsigned char)s[i]);
    }
    printf("\n");
}

int main() {
    // 准备输入数据（你可以根据函数可能的用途修改这里）
    char input[256] = "Hello World! Test Probe.";
    char output[256] = {0};

    printf("--- Starting Execution Probe ---\n");
    
    // 执行汇编函数
    // 如果汇编逻辑导致堆栈崩溃或内存越界，程序会在这里直接 Crash
    func0(input, output);

    printf("--- Execution Finished Successfully ---\n");
    
    // 打印输入输出的十六进制，方便后期分析逻辑
    print_hex("Input ", input, 24);
    print_hex("Output", output, 24);
    printf("Output (String): %s\n", output);

    return 0; // 正常退出表示“执行语义自洽”
}