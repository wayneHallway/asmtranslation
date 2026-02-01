func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     x19, x0
    mov     w20, w1
    lsl     x0, x20, 2
    bl      malloc
    mov     x21, x0
    cmp     w20, 0
    ble     .Ldone
    mov     w0, 0
.Lloop:
    lsl     x1, x0, 2
    ldr     w2, [x19, x1]
    str     w2, [x21, x1]
    add     w0, w0, 1
    cmp     w0, w20
    blt     .Lloop
.Ldone:
    mov     x0, x21
    ldr     x21, [sp, 32]
    ldr     x20, [sp, 24]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret