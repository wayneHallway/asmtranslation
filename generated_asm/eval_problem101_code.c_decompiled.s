func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     w19, w0
    lsl     x0, x19, 2
    bl      malloc
    mov     x20, x0
    str     w19, [x20]
    cmp     w19, 3
    blt     .Lreturn
    sub     w21, w19, #1
    mov     w1, 1
.Lloop:
    cmp     w21, 1
    ble     .Lreturn
    add     w2, w19, w21
    str     w2, [x20, w1, sxtw 2]
    add     w1, w1, 1
    add     w2, w2, 1
    str     w2, [x20, w1, sxtw 2]
    add     w1, w1, 1
    add     w2, w2, 1
    str     w2, [x20, w1, sxtw 2]
    add     w1, w1, 1
    add     w2, w2, 7
    str     w2, [x20, w1, sxtw 2]
    add     w1, w1, 1
    sub     w21, w21, #8
    b       .Lloop
.Lreturn:
    mov     x0, x20
    ldr     x21, [sp, 32]
    ldr     x20, [sp, 24]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret