func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x0, [sp, 24]
    str     w1, [sp, 20]
    ldr     w1, [sp, 20]
    sxtw    x0, w1
    bl      malloc
    str     x0, [sp, 32]
    str     wzr, [sp, 40]
    b       .L2
.L3:
    ldr     w0, [sp, 40]
    sxtw    x1, w0
    ldr     x0, [sp, 32]
    add     x2, x0, x1
    ldr     w0, [sp, 40]
    sxtw    x1, w0
    ldr     x0, [sp, 24]
    add     x0, x0, x1
    ldrb    w0, [x0]
    strb    w0, [x2]
    ldr     w0, [sp, 40]
    add     w0, w0, 1
    str     w0, [sp, 40]
.L2:
    ldr     w1, [sp, 40]
    ldr     w0, [sp, 20]
    cmp     w1, w0
    blt     .L3
    ldr     x0, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret