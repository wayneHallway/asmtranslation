func0:
    stp     x29, x30, [sp, -80]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    mov     x29, sp
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    lsl     x0, x20, 2
    bl      malloc
    mov     x22, x0
    mov     w23, 0
    b       .L1
.L6:
    lsl     x24, x23, 2
    ldr     w25, [x19, x24]
    str     w25, [x22, x24]
    mov     w26, 0
    b       .L2
.L5:
    lsl     x27, x26, 2
    ldr     w0, [x22, x27]
    ldr     w1, [x22, x24]
    cmp     w0, w1
    ble     .L3
    ldr     w2, [x22, x24]
    str     w2, [x22, x27]
    str     w0, [x22, x24]
.L3:
    add     w26, w26, 1
.L2:
    cmp     w26, w23
    blt     .L5
    add     w23, w23, 1
.L1:
    cmp     w23, w20
    blt     .L6
    mov     w23, 0
    sub     w24, w20, 1
    b       .L7
.L8:
    lsl     x25, x23, 2
    lsl     x26, x24, 2
    ldr     w0, [x22, x25]
    ldr     w1, [x22, x26]
    str     w1, [x22, x25]
    str     w0, [x22, x26]
    add     w23, w23, 1
    sub     w24, w24, 1
.L7:
    cmp     w23, w24
    blt     .L8
    str     w23, [x21]
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret