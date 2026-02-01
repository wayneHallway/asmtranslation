func0:
        mov     w2, 0
        b       .L2
.L3:
        ldrb    w3, [x0, w2, sxtw]
        strb    w3, [x1, w2, sxtw]
        add     w2, w2, 1
.L2:
        ldrb    w3, [x0, w2, sxtw]
        cbnz    w3, .L3
        strb    wzr, [x1, w2, sxtw]
        mov     w0, w2
        ret