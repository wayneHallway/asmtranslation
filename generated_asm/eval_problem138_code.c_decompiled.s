func0:
        and     w1, w0, #1
        cmp     w1, #0
        bne     .Lfalse
        cmp     w0, #8
        blt     .Lfalse
        mov     w0, #1
        ret
.Lfalse:
        mov     w0, #0
        ret