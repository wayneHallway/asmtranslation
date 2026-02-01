func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    mov     x19, x0
    mov     x20, x1
    bl      strlen
    mov     w21, w0
    mov     w22, 0
    b       .L2
.L3:
    ldrb    w0, [x19, x22]
    bl      toupper
    strb    w0, [x20, x22]
    add     w22, w22, 1
.L2:
    cmp     w22, w21
    blt     .L3
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret