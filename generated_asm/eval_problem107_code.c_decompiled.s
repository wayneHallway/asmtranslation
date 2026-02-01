func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     w19, w0
    lsl     x20, x19, 2
    mov     x0, x20
    bl      malloc
    mov     x21, x0
    mov     w0, 0
    b       .L2
.L3:
    sxtw    x1, w0
    lsl     x1, x1, 2
    str     w0, [x21, x1]
    add     w0, w0, 1
.L2:
    cmp     w0, w19
    blt     .L3
    mov     x0, x21
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 24]
    ldr     x21, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret