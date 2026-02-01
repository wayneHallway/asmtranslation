func0:
    stp     x29, x30, [sp, -80]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    mov     x29, sp
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     x22, x3
    mov     x0, x21
    bl      strlen
    mov     w23, w0
    sxtw    x24, w20
    lsl     x0, x24, 3
    bl      malloc
    mov     x25, x0
    str     x25, [x22]
    mov     w26, 0
    mov     w22, 0
    mov     w21, 0
    cmp     w20, 0
    ble     .Lend_loop
.Lloop:
    sxtw    x0, w21
    ldr     x0, [x19, x0, lsl 3]
    mov     x1, x21
    mov     w2, w23
    bl      strncmp
    cbnz    w0, .Lskip
    sxtw    x0, w26
    sxtw    x1, w21
    ldr     x1, [x19, x1, lsl 3]
    str     x1, [x25, x0, lsl 3]
    add     w26, w26, 1
.Lskip:
    add     w21, w21, 1
    cmp     w21, w20
    blt     .Lloop
.Lend_loop:
    mov     w0, w26
    ldp     x25, x26, [sp, 64]
    ldp     x23, x24, [sp, 48]
    ldp     x21, x22, [sp, 32]
    ldp     x19, x20, [sp, 16]
    ldp     x29, x30, [sp], 80
    ret