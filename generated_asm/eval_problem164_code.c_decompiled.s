func0:
    stp     x29, x30, [sp, -64]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]

    mov     w19, w0
    mov     w20, w1
    mov     x21, x2
    mov     x22, x3

    str     wzr, [x22]
    b       .L2

.L8:
    mov     w23, 1
    mov     w24, 2
    b       .L3

.L5:
    sdiv    w0, w19, w24
    msub    w0, w0, w24, w19
    cbnz    w0, .L4
    mov     w23, wzr
    b       .L6

.L4:
    add     w24, w24, 1

.L3:
    lsr     w0, w19, 1
    cmp     w24, w0
    ble     .L5

.L6:
    cbz     w23, .L7
    ldr     w0, [x22]
    sxtw    x1, w0
    str     w19, [x21, x1, lsl 2]
    add     w0, w0, 1
    str     w0, [x22]

.L7:
    add     w19, w19, 1

.L2:
    cmp     w19, w20
    ble     .L8

    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x29, x30, [sp], 64
    ret