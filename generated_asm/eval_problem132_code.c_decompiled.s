func0:
        cmp     w0, 1
        b.ge    .L2
        mov     w0, 0
        ret
.L2:
        mov     w1, 1
        mov     w2, 0
        mov     w3, 1
        mov     w4, 3435973837
        cmp     w0, 9
        b.le    .L3
.L5:
        sdiv    w5, w0, w4
        lsl     w5, w5, 1
        subs    w6, w0, w5
        cset    w2, ne
        mul     w1, w1, w2
        mov     w5, 10
        sdiv    w0, w0, w5
        cmp     w0, 9
        b.gt    .L5
.L3:
        cmp     w2, 0
        beq     .L6
        mov     w0, w2
        ret
.L6:
        mov     w0, w1
        ret