func0:
    stp     x29, x30, [sp, -64]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     w22, 0
    mov     w23, 0
    mov     w24, 0
    b       .L2
.L8:
    mov     w0, w24
    b       .L3
.L7:
    sxtw    x0, w0
    ldr     w1, [x19, x0, lsl 2]
    cmp     w1, 0
    bge     .L4
    cmp     w22, w1
    bge     .L5
    mov     w22, w1
    b       .L5
.L4:
    cmp     w23, w1
    bge     .L5
    mov     w23, w1
.L5:
    add     w0, w0, 1
.L3:
    cmp     w0, w20
    blt     .L7
    add     w24, w24, 1
.L2:
    cmp     w24, w20
    blt     .L8
    str     w22, [x21]
    str     w23, [x21, 4]
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x29, x30, [sp], 64
    ret