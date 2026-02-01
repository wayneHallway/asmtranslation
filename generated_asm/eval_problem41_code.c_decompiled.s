func0:
    sub     sp, sp, #48
    str     x19, [sp, #16]
    str     x20, [sp, #24]
    str     x21, [sp, #32]
    str     x22, [sp, #40]
    mov     w19, w1
    mov     x20, x0
    mov     w21, #0
    mov     w22, #0
    b       .L1_test
.L1:
    mov     w1, w22
    b       .L2_test
.L2:
    mov     w2, w22
    b       .L3_test
.L3:
    ldr     w3, [x20, w22, sxtw #2]
    ldr     w4, [x20, w1, sxtw #2]
    add     w3, w3, w4
    ldr     w4, [x20, w2, sxtw #2]
    cmp     w3, w4
    bne     .L3_next
    mov     w21, #1
    b       .L2_next
.L3_next:
    add     w2, w2, #1
.L3_test:
    cmp     w2, w1
    ble     .L3
.L2_next:
    cmp     w21, #1
    beq     .L1_next
    add     w1, w1, #1
.L2_test:
    cmp     w1, w19
    blt     .L2
.L1_next:
    cmp     w21, #1
    beq     .L_end
    add     w22, w22, #1
.L1_test:
    cmp     w22, w19
    blt     .L1
.L_end:
    mov     w0, w21
    ldr     x19, [sp, #16]
    ldr     x20, [sp, #24]
    ldr     x21, [sp, #32]
    ldr     x22, [sp, #40]
    add     sp, sp, #48
    ret