func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     x19, x0
    mov     w20, w1
    mov     w21, 0
    mov     w0, 0
    b       .L2
.L3:
    sxtw    x0, w0
    ldr     w1, [x19, x0, lsl 2]
    bl      get_sum
    add     w21, w21, w0
    add     w0, w0, 1
.L2:
    cmp     w0, w20
    blt     .L3
    mov     w0, w21
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 24]
    ldr     x21, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret