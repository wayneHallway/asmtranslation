func0:
        mov     x2, 0
        mov     w0, 0
        b       .L2
.L3:
        ldrsw   x3, [x1, x2, lsl 2]
        add     w3, w3, 99
        add     w0, w0, w3
        add     x2, x2, 1
.L2:
        cmp     x2, x0
        blt     .L3
        ret