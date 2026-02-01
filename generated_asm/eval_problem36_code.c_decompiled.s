func0:
        mov     w3, #-16777216
        fmov    s0, w3
        cmp     w1, #0
        b.le    .Lreturn
        mov     w2, wzr
.Lloop:
        lsl     x4, x2, #3
        madd    x4, x4, x2, x0
        ldr     s1, [x4]
        fcmp    s0, s1
        b.ge    .Lskip
        fmov    s0, s1
.Lskip:
        add     w2, w2, #1
        cmp     w1, w2
        b.gt    .Lloop
.Lreturn:
        ret