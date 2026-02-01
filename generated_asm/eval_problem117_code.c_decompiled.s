func0:
    stp     x29, x30, [sp, -80]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    mov     x19, x0
    mov     w20, w1
    mov     w21, 0
    b       .L1_test
.L1_loop:
    mov     w22, w21
    b       .L2_test
.L2_loop:
    sxtw    x0, w21
    ldr     w23, [x19, x0, lsl 2]
    sxtw    x0, w22
    ldr     w24, [x19, x0, lsl 2]
    cmp     w23, w24
    bge     .L2_update
    mov     w0, w23
    bl      bitcount
    mov     w25, w0
    mov     w0, w24
    bl      bitcount
    mov     w26, w0
    cmp     w25, w26
    bge     .L2_update
    sxtw    x0, w21
    ldr     w1, [x19, x0, lsl 2]
    sxtw    x0, w22
    ldr     w2, [x19, x0, lsl 2]
    str     w2, [x19, x0, lsl 2]
    sxtw    x0, w21
    str     w1, [x19, x0, lsl 2]
.L2_update:
    add     w22, w22, 1
.L2_test:
    cmp     w22, w20
    blt     .L2_loop
    add     w21, w21, 1
.L1_test:
    cmp     w21, w20
    blt     .L1_loop
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret