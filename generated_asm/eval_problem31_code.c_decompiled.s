func0:
    stp     x29, x30, [sp, -64]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    str     x23, [sp, 48]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    sxtw    x0, w1
    lsl     x0, x0, 2
    bl      malloc
    mov     x22, x0
    str     wzr, [x21]
    mov     w23, 0
    b       .L2
.L3:
    sxtw    x0, w23
    ldr     s0, [x19, x0, lsl 2]
    fmov    s1, wzr
    fcmp    s0, s1
    b.le    .L4
    ldr     w0, [x21]
    sxtw    x1, w0
    sxtw    x2, w23
    ldr     s0, [x19, x2, lsl 2]
    str     s0, [x22, x1, lsl 2]
    ldr     w0, [x21]
    add     w0, w0, 1
    str     w0, [x21]
.L4:
    add     w23, w23, 1
.L2:
    cmp     w23, w20
    blt     .L3
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldr     x23, [sp, 48]
    ldp     x29, x30, [sp], 64
    ret