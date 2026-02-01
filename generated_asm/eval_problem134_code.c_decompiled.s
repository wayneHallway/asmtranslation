func0:
        mov     w2, 0
        mov     w3, 0
        cbz     w1, .L4
.L3:
        ldr     s0, [x0], 4
        fmul    s0, s0, s0
        fcvtzs  w4, s0
        add     w2, w2, w4
        add     w3, w3, 1
        cmp     w1, w3
        bgt     .L3
        mov     w0, w2
        ret
.L4:
        mov     w0, 0
        ret