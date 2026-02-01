func0:
    mov w3, 0
    mov w4, 0
    b .L2
.L7:
    mov w5, 0
    b .L3
.L6:
    ldr w6, [x0, w4, sxtw 2]
    ldr w7, [x0, w5, sxtw 2]
    add w6, w6, w7
    cbnz w6, .L4
    mov w3, 1
    b .L5
.L4:
    add w5, w5, 1
.L3:
    cmp w5, w1
    blt .L6
.L5:
    cbnz w3, .L8
    add w4, w4, 1
.L2:
    cmp w4, w1
    blt .L7
.L8:
    mov w0, w3
    ret