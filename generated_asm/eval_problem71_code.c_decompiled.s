func0:
    stp     x29, x30, [sp, -64]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    cmp     w20, 2
    ble     .Louter_end
    mov     w22, 2
.Louter_loop:
    ldr     w23, [x19, w22, sxtw 2]
    sub     w24, w22, #1
    mov     w0, w22
.Linner_loop:
    cmp     w24, 0
    blt     .Linner_end
    ldr     w1, [x19, w24, sxtw 2]
    cmp     w1, w23
    ble     .Linner_end
    str     w1, [x19, w0, sxtw 2]
    mov     w0, w24
    sub     w24, w24, #1
    b       .Linner_loop
.Linner_end:
    str     w23, [x19, w0, sxtw 2]
    add     w22, w22, #1
    cmp     w22, w20
    blt     .Louter_loop
.Louter_end:
    mov     w22, 0
    mov     w23, w20
.Lcopy_loop:
    cmp     w22, w23
    bge     .Lcopy_end
    sub     w24, w23, #1
    ldr     w0, [x19, w24, sxtw 2]
    str     w0, [x21, w22, sxtw 2]
    sub     w23, w23, #1
    add     w22, w22, #1
    sub     w24, w23, #1
    ldr     w0, [x19, w24, sxtw 2]
    str     w0, [x21, w22, sxtw 2]
    add     w22, w22, #1
    b       .Lcopy_loop
.Lcopy_end:
    ldp     x23, x24, [sp, 48]
    ldp     x21, x22, [sp, 32]
    ldp     x19, x20, [sp, 16]
    ldp     x29, x30, [sp], 64
    ret