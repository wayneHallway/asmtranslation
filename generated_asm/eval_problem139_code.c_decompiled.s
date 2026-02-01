func0:
        and     w1, w0, #1
        cmp     w0, #8
        ccmp    w1, #0, #0, cs
        cset    w0, eq
        ret