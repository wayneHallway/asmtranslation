func0:
    ldr     s0, [x0]
    str     s0, [x2]
    ldr     s1, [x0, #4]
    str     s1, [x2, #4]
    mov     w4, #0
    mov     w5, #0
    str     w5, [x3]
    str     w5, [x3, #4]
    b       .Lcheck
.Lloop:
    ldr     s2, [x0, w4, sxtw #2]
    fcmp    s2, s0
    bge     .Lskip_min
    fmov    s0, s2
    str     w4, [x3]
.Lskip_min:
    fcmp    s2, s1
    ble     .Lskip_max
    fmov    s1, s2
    str     w4, [x3, #4]
.Lskip_max:
    add     w4, w4, #1
.Lcheck:
    cmp     w4, w1
    blt     .Lloop
    str     s0, [x2]
    str     s1, [x2, #4]
    ret