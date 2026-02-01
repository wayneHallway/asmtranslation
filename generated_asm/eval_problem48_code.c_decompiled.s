func0:
        mov     w3, 0
        cmp     w1, 0
        ble     .L9
.L8:
        sxtw    x4, w3
        lsl     x4, x4, 2
        add     x4, x0, x4
        mov     w2, w3
        b       .L4
.L7:
        sxtw    x5, w2
        ldr     s1, [x4]
        lsl     x5, x5, 2
        add     x5, x0, x5
        ldr     s0, [x5]
        fcmp    s1, s0
        ble     .L3
        str     s0, [x4]
        str     s1, [x5]
.L3:
        add     w2, w2, 1
.L4:
        cmp     w2, w1
        blt     .L7
        add     w3, w3, 1
        cmp     w3, w1
        blt     .L8
.L9:
        asr     w1, w1, 1
        sxtw    x1, w1
        ldr     s0, [x0, x1, lsl 2]
        ret