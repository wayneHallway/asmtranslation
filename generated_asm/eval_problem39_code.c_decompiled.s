func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    mov     x19, x0
    mov     w20, w1
    bl      strlen
    mov     w21, w0
    cmp     w21, 0
    ble     .Lend
    mov     w22, 0
.Lloop:
    cmp     w22, w21
    bge     .Lloop_end
    add     w9, w22, 2
    mov     w10, w22
    ldrb    w11, [x19, w10, sxtw]
    ldrb    w12, [x19, w9, sxtw]
    strb    w12, [x19, w10, sxtw]
    add     w13, w9, 1
    ldrb    w12, [x19, w13, sxtw]
    strb    w12, [x19, w9, sxtw]
    strb    w11, [x19, w13, sxtw]
    add     w22, w22, 3
    b       .Lloop
.Lloop_end:
    cbz     w20, .Lend
    ldrb    w9, [x19]
    ldrb    w10, [x19, 1]
    strb    w10, [x19]
    ldrb    w10, [x19, 2]
    strb    w10, [x19, 1]
    strb    w9, [x19, 2]
.Lend:
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret