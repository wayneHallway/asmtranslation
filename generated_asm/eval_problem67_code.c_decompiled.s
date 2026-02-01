func0:
        mov     w1, 0
        b       .L2
.L4:
        bl      is_uppercase
        add     w1, w1, w0
        add     x0, x0, 1
.L2:
        ldrb    w2, [x0]
        cbz     w2, .L3
        mov     w0, w2
        b       .L4
.L3:
        mov     w0, w1
        ret