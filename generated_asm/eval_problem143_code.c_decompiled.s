func0:
        mov     w2, 0
        mov     w3, 0
        b       .L2
.L3:
        ldrsw   x4, [x0, w2, sxtw 2]
        mul     x4, x4, x4
        add     w3, w3, w4
        add     w2, w2, 1
.L2:
        cmp     w2, w1
        blt     .L3
        mov     w0, w3
        ret