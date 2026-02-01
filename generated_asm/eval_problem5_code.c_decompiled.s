func0:
        mov     w3, 0
        scvtf   s1, w3
        cmp     w1, 0
        ble     .L4
        mov     w3, 0
        mov     s0, s1
.L3:
        ldr     s2, [x0]
        add     w3, w3, 1
        fadd    s0, s0, s2
        add     x0, x0, x2, lsl 2
        cmp     w1, w3
        bgt     .L3
        scvtf   s1, w1
        fdiv    s0, s0, s1
        ret
.L4:
        fmov    s0, s1
        ret