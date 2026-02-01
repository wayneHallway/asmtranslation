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
    lsl     x0, x20, 2
    bl      malloc
    mov     x23, x0
    str     x23, [x21]
    str     wzr, [x22]
    mov     w24, 0
    b       .L2
.L7:
    sxtw    x0, w24
    lsl     x0, x0, 2
    ldr     w1, [x19, x0]
    tbnz    w1, #31, .L3
    mov     w25, w24
    b       .L4
.L5:
    sxtw    x0, w25
    lsl     x0, x0, 2
    add     x1, x19, x0
    sub     x0, x0, 4
    add     x0, x19, x0
    bl      swap
    sub     w25, w25, 1
.L4:
    cmp     w25, 0
    ble     .L3
    sxtw    x0, w25
    lsl     x0, x0, 2
    ldr     w1, [x19, x0]
    sub     x0, x0, 4
    ldr     w0, [x19, x0]
    cmp     w1, w0
    blt     .L5
.L3:
    add     w24, w24, 1
.L2:
    cmp     w24, w20
    blt     .L7
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret