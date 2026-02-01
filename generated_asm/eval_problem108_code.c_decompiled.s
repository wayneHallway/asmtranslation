func0:
    stp     x29, x30, [sp, -32]!
    mov     x29, sp
    str     x19, [sp, 16]
    mov     w19, w0
    mov     x0, 4
    bl      malloc
    mov     x1, 0
    str     w1, [x0]
    cmp     w19, 0
    ble     .Lend
    mov     w2, 1
.Lloop:
    ldr     w1, [x0]
    add     w1, w1, 1
    str     w1, [x0]
    cmp     w2, w19
    bne     .Lskip
    add     w1, w1, 1
    str     w1, [x0]
.Lskip:
    add     w2, w2, 1
    cmp     w2, w19
    ble     .Lloop
.Lend:
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 32
    ret