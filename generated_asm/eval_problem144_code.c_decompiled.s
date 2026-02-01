func0:
    stp     x29, x30, [sp, -64]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    mov     x19, x0
    mov     x20, x1
    mov     x21, x2
    mov     w22, 0
    mov     w23, 0
    mov     w24, 0
.Lloop:
    ldrb    w0, [x19, w22, sxtw]
    cmp     w0, ' '
    bne     .Lcheck_null
    strb    w0, [x21, w23, sxtw]
    add     w23, w23, 1
    b       .Lincrement
.Lcheck_null:
    cmp     w0, 0
    beq     .Lbreak
    mov     w24, 2
.Lk_loop:
    mov     w0, w24
    mul     w1, w0, w0
    cmp     w1, w20
    bgt     .Lprime
    sdiv    w1, w20, w24
    msub    w1, w1, w24, w20
    cmp     w1, 0
    beq     .Lnot_prime
    add     w24, w24, 1
    b       .Lk_loop
.Lprime:
    add     x0, x21, w23, sxtw
    add     x1, x19, w22, sxtw
    mov     x2, x20
    bl      memcpy
    add     w23, w23, w20
    b       .Lbreak
.Lnot_prime:
    mov     w0, ' '
    strb    w0, [x21, w23, sxtw]
    add     w23, w23, 1
.Lincrement:
    add     w22, w22, 1
    b       .Lloop
.Lbreak:
    strb    wzr, [x21, w23, sxtw]
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x29, x30, [sp], 64
    ret