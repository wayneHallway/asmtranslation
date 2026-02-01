func0:
        cmp     w0, 0
        bgt     .L2
        mov     w0, 1
        ret
.L2:
        mov     w3, w0
        and     w4, w0, 3
        mov     w2, 1
        cmp     w3, 4
        blt     .L3
.L4:
        lsl     w2, w2, 1
        sdiv    w5, w2, w1
        msub    w2, w5, w1, w2
        lsl     w2, w2, 1
        sdiv    w5, w2, w1
        msub    w2, w5, w1, w2
        lsl     w2, w2, 1
        sdiv    w5, w2, w1
        msub    w2, w5, w1, w2
        sub     w3, w3, 4
        cmp     w3, 4
        bge     .L4
.L3:
        cmp     w4, 0
        beq     .L5
.L6:
        lsl     w2, w2, 1
        sdiv    w0, w2, w1
        msub    w2, w0, w1, w2
        sub     w4, w4, 1
        cbnz    w4, .L6
.L5:
        mov     w0, w2
        ret