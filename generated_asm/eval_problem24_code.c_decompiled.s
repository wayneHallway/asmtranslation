func0:
        mov     w1, -1
        b       .L2
.L3:
        add     w1, w1, 1
        add     x0, x0, 1
.L2:
        ldrb    w2, [x0]
        cbnz    w2, .L3
        mov     w0, w1
        ret