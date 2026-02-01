func0:
        cmp     w0, 0
        ble     .Lret0
        cmp     w0, 1
        beq     .Lret1
        mov     w1, 18
        cmp     w0, 4
        blt     .Lret_ans
        sub     w0, w0, #2
        mov     w2, 100000000
        mov     w3, 10
.Lloop:
        cmp     w0, 0
        ble     .Lret_ans
        mul     w1, w1, w2
        mul     w1, w1, w2
        mul     w1, w1, w2
        mul     w1, w1, w2
        mul     w1, w1, w3
        mul     w1, w1, w3
        mul     w1, w1, w3
        mul     w1, w1, w3
        sub     w0, w0, #8
        b       .Lloop
.Lret0:
        mov     w0, 0
        ret
.Lret1:
        mov     w0, 1
        ret
.Lret_ans:
        mov     w0, w1
        ret