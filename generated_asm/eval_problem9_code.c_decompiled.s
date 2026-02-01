func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    stp     x0, x1, [x29, 24]
    str     x2, [x29, 40]
    mov     w19, 0
    mov     w9, 0
    mov     w10, 0
    b       .L2
.L3:
    ldr     x11, [x29, 24]
    ldrsw   x12, [x29, 32]
    ldr     w13, [x11, x12, lsl 2]
    add     w10, w10, w13
    mul     w14, w13, w10
    add     w9, w9, w14
    ldr     x15, [x29, 32]
    add     x15, x15, 1
    str     x15, [x29, 32]
.L2:
    ldr     x15, [x29, 32]
    ldr     x16, [x29, 40]
    cmp     x15, x16
    blt     .L3
    ldr     x17, [x29, 48]
    str     w10, [x17]
    str     w9, [x17, 4]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret