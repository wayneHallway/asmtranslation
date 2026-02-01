func0:
        mov     w2, 1
        mov     w3, 0
        cmp     w0, 0
        ble     .L8
.L3:
        cmp     w0, w2
        beq     .L9
        mul     w2, w2, w1
        cmp     w0, w2
        blt     .L8
        cmp     w3, 99
        bgt     .L8
        add     w3, w3, 1
        b       .L3
.L8:
        mov     w0, 0
        ret
.L9:
        mov     w0, 1
        ret