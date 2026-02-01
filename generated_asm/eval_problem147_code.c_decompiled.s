func0:
        mov     w2, 0
        mov     w3, 0
        b       .L2
.L5:
        ldrsw   x4, [x3, x0]
        cmp     w4, 11
        bgt     .L3
        mov     w5, 1431655766
        smull   x5, w4, w5
        asr     x5, x5, 32
        sub     w6, w5, w4, asr 31
        add     w6, w6, w6, lsl 1
        cmp     w4, w6
        bne     .L3
        add     w2, w2, 1
.L3:
        add     w3, w3, 1
.L2:
        cmp     w3, w1
        blt     .L5
        mov     w0, w2
        ret