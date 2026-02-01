func0:
        mov     w1, #0
        b       .L2
.L3:
        add     w1, w1, #1
.L2:
        mul     w2, w1, w1
        mul     w2, w2, w1
        neg     w3, w0
        cmp     w2, w3
        blt     .L3
        mov     w0, w1
        ret