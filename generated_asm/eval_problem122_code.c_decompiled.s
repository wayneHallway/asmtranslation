func0:
        mov     w2, 0
        mov     w3, 0
        cmp     w1, 0
        ble     .L4
.L3:
        ldrsw   x4, [x0, w2, sxtw 2]
        add     w3, w3, w4
        add     w2, w2, 1
        cmp     w2, w1
        blt     .L3
        mov     w0, w3
        ret
.L4:
        mov     w3, 0
        mov     w0, w3
        ret