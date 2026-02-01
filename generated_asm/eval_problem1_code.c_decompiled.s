func0:
        mov     w2, 0
        cmp     w1, 0
        ble     .L8
.L7:
        mov     w3, 0
        cmp     w1, 0
        ble     .L4
.L6:
        smull   x4, w2, w1
        add     x4, x4, x3, sxtw
        ldr     s0, [x0, x4, lsl 2]
        fabs    s0, s0
        fmov    w4, s0
        mov     w5, 1008981770
        cmp     w4, w5
        bgt     .L9
        add     w3, w3, 1
        cmp     w1, w3
        bgt     .L6
.L4:
        add     w2, w2, 1
        cmp     w1, w2
        bgt     .L7
.L8:
        mov     w0, 0
        ret
.L9:
        mov     w0, 1
        ret