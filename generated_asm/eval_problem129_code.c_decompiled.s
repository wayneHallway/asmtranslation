func0:
        cmp     w1, 0
        bne     .LBB0_2
        mov     w0, #-2147483648
        ret
.LBB0_2:
        ldr     w8, [x0]
        mov     w9, w8
        mov     w10, 0
        mov     w11, 0
.LBB0_3:
        cmp     w11, w1
        bge     .LBB0_6
        add     w12, w10, w9
        cmp     w9, w12
        csel    w10, w9, w12, ge
        cmp     w8, w10
        csel    w8, w8, w10, ge
        add     w11, w11, #1
        ldr     w9, [x0, w11, sxtw #2]
        b       .LBB0_3
.LBB0_6:
        mul     w0, w8, w10
        ret