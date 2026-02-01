func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 32]
    mov     x19, x0
    bl      strlen
    mov     w20, w0
    cmp     w20, 0
    ble     .Lcheck_n
    mov     w1, 0
    mov     w2, 0
.Lcount_loop:
    ldrb    w3, [x19, w1, sxtw]
    cmp     w3, 0
    bge     .Lskip_inc
    add     w2, w2, 1
.Lskip_inc:
    add     w1, w1, 1
    cmp     w1, w20
    blt     .Lcount_loop
    b       .Lafter_count
.Lcheck_n:
    mov     w2, 0
.Lafter_count:
    cmp     w2, w20
    bne     .Lreturn
    mov     w1, 0
.Lreverse_loop:
    cmp     w1, w20
    bge     .Lreturn
    add     w3, w20, w1
    sub     w3, w3, #1
    ldrb    w4, [x19, w1, sxtw]
    ldrb    w5, [x19, w3, sxtw]
    strb    w5, [x19, w1, sxtw]
    strb    w4, [x19, w3, sxtw]
    add     w1, w1, 2
    b       .Lreverse_loop
.Lreturn:
    mov     x0, x19
    ldr     x20, [sp, 32]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret