func0:
        mov     w9, #0
        cmp     w3, #0
        b.le    .Lreturn
        mov     w8, #0
.Louter:
        cmp     w2, #0
        b.le    .Lnext_row
        madd    x10, x8, x1, x0
        mov     w11, #0
        mov     x12, x10
.Linner:
        ldrb    w13, [x12], #1
        add     w11, w11, #1
        add     w9, w9, w13
        cmp     w11, w2
        b.lt    .Linner
.Lnext_row:
        add     w8, w8, #1
        cmp     w8, w3
        b.lt    .Louter
.Lreturn:
        mov     w0, w9
        ret