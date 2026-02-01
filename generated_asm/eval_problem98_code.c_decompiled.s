func0:
        sdiv    w2, w0, w5
        lsl     w2, w2, 1
        sub     w0, w0, w2
        sdiv    w2, w1, w5
        lsl     w2, w2, 1
        sub     w1, w1, w2
        mul     w0, w0, w1
        mul     w0, w0, w0
        ret