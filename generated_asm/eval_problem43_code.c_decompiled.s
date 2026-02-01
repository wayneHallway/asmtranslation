func0:
    cmp w1, #0
    ble .Ldone
    mov w3, #0
.Lloop:
    ldr w4, [x0]
    add w4, w4, w2
    str w4, [x0], #4
    add w3, w3, #1
    cmp w3, w1
    blt .Lloop
.Ldone:
    ret