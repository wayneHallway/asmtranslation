func0:
    mov     w3, wzr
    b       .L2
.L3:
    sxtw    x4, w3
    ldr     w5, [x0, x4, lsl 2]
    mul     w5, w5, w3
    scvtf   s0, w5
    str     s0, [x2, x4, lsl 2]
    add     w3, w3, 1
.L2:
    cmp     w3, w1
    blt     .L3
    ret