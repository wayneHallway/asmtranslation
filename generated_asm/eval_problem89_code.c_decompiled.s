func0:
    stp     x29, x30, [sp, -80]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    str     x25, [sp, 64]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     x22, x3
    str     w20, [x22]
    cbnz    w20, .L2
    str     xzr, [x21]
    b       .L1
.L2:
    sxtw    x0, w20
    lsl     x0, x0, 2
    bl      malloc
    mov     x23, x0
    str     x23, [x21]
    cbnz    x23, .L3
    mov     w0, 1
    bl      exit
.L3:
    mov     w24, 0
    mov     w25, 0
    mov     w21, 0
    mov     w22, w20
    sub     w0, w20, #1
    sxtw    x0, w0
    ldr     w19, [x19, x0, lsl 2]
    add     w0, w19, w22
.L4:
    cmp     w22, 1
    bne     .L5
    sxtw    x0, w24
    str     w25, [x23, x0, lsl 2]
    b       .L1
.L5:
    cmp     w19, w0
    bne     .L6
    sxtw    x1, w24
    str     w25, [x23, x1, lsl 2]
    add     w24, w24, 1
    sub     w22, w22, 1
    mov     w25, 0
    sub     w1, w22, #1
    sxtw    x1, w1
    ldr     w19, [x19, x1, lsl 2]
    add     w0, w19, w22
    b       .L4
.L6:
    mov     w21, w25
    add     w25, w25, 1
    b       .L4
.L1:
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldr     x25, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret