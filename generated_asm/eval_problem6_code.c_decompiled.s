func0:
    stp     x29, x30, [sp, -64]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    mov     x29, sp

    mov     w19, w1
    mov     w20, w2
    mov     x21, x0
    mov     x22, x3

    lsl     w0, w19, 1
    bl      malloc
    mov     x23, x0

    lsl     w24, w19, 1
    str     w24, [x22]

    cmp     w19, 0
    ble     .L_exit

    mov     w9, 0
.L_loop:
    lsl     w10, w9, 1
    add     x11, x23, w10, sxtw
    strb    w20, [x11]

    add     x12, x21, w9, sxtw
    ldrb    w13, [x12]
    add     x14, x23, w10, sxtw
    strb    w13, [x14, 1]

    add     w9, w9, 1
    cmp     w9, w19
    blt     .L_loop

.L_exit:
    ldp     x23, x24, [sp, 48]
    ldp     x21, x22, [sp, 32]
    ldp     x19, x20, [sp, 16]
    ldp     x29, x30, [sp], 64
    ret