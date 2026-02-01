func0:
        cmp     w0, 5
        b.ge    .Lelse
        mov     w0, 1
        ret
.Lelse:
        mov     w1, 2
        b       .Lcond
.Lloop:
        sdiv    w2, w0, w1
        mul     w3, w1, w1
        cmp     w3, w0
        b.gt    .Lend
        mul     w3, w2, w1
        cmp     w3, w0
        b.ne    .Linc
        mov     w0, w2
        ret
.Linc:
        add     w1, w1, 1
.Lcond:
        cmp     w1, w0
        b.le    .Lloop
.Lend:
        ret