func0:
        cmp      w3, #0
        ble      .Lret
        mov      w4, #0
.Lloop:
        ldr      w5, [x0, w4, sxtw #2]
        ldr      w6, [x1, w4, sxtw #2]
        sub      w5, w5, w6
        str      w5, [x2, w4, sxtw #2]
        add      w4, w4, #1
        cmp      w4, w3
        blt      .Lloop
.Lret:
        ret