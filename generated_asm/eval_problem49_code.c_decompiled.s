func0:
    stp     x29, x30, [sp, -32]!
    mov     x29, sp
    str     x19, [sp, 16]
    mov     x19, x0
    bl      strlen
    cmp     x0, 3
    b.lt    .Lreturn1
    ldrb    w1, [x19]
    add     x0, x19, x0
    ldrb    w0, [x0, -1]
    cmp     w1, w0
    b.eq    .Lreturn1
    mov     w0, 0
    b       .Lexit
.Lreturn1:
    mov     w0, 1
.Lexit:
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 32
    ret