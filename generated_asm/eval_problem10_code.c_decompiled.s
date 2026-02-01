func0:
    stp     x29, x30, [sp, -80]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    str     x25, [sp, 64]
    mov     x19, x0
    mov     w20, w1
    cmp     w20, 0
    bgt     .L2
    mov     x0, 0
    b       .L3
.L2:
    sxtw    x0, w20
    lsl     x0, x0, 2
    bl      malloc
    mov     x21, x0
    cmp     x21, 0
    bne     .L4
    mov     x0, 0
    b       .L3
.L4:
    ldr     w0, [x19]
    str     w0, [x21]
    cmp     w20, 1
    bne     .L5
    mov     x0, x21
    b       .L3
.L5:
    sub     w22, w20, #1
    mov     w23, w22
    mov     w24, w22
    mov     w25, w22
    ldr     w0, [x19]
    b       .L6
.L7:
    cmp     w23, 0
    ble     .L8
    sxtw    x0, w23
    ldr     w1, [x19, x0, lsl 2]
    cmp     w1, w0
    csel    w0, w1, w0, gt
    sxtw    x1, w22
    str     w0, [x21, x1, lsl 2]
    sub     w22, w22, #1
    sub     w23, w23, #1
    sub     w24, w24, #1
.L8:
    cmp     w24, 0
    ble     .L9
    sxtw    x1, w23
    ldr     w2, [x19, x1, lsl 2]
    cmp     w2, w0
    csel    w0, w2, w0, gt
    sxtw    x2, w22
    str     w0, [x21, x2, lsl 2]
    sub     w22, w22, #1
    sub     w23, w23, #1
    sub     w24, w24, #1
.L9:
    cmp     w24, 0
    ble     .L10
    sxtw    x2, w23
    ldr     w3, [x19, x2, lsl 2]
    cmp     w3, w0
    csel    w0, w3, w0, gt
    sxtw    x3, w22
    str     w0, [x21, x3, lsl 2]
    sub     w22, w22, #1
    sub     w23, w23, #1
    sub     w24, w24, #1
.L10:
    cmp     w24, 0
    ble     .L6
    sxtw    x3, w23
    ldr     w4, [x19, x3, lsl 2]
    cmp     w4, w0
    csel    w0, w4, w0, gt
    sxtw    x4, w22
    str     w0, [x21, x4, lsl 2]
    sub     w22, w22, #1
    sub     w23, w23, #1
    sub     w24, w24, #1
.L6:
    cmp     w24, 0
    bgt     .L7
    mov     x0, x21
.L3:
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldr     x25, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret