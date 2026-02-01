func0:
    cmp w1, #0
    ble .Lreturn1
    ldr w3, [x0]
    cmp w2, w3
    blt .Lreturn0
    mov w4, #0
    b .Lloop_check
.Lloop:
    ldr w3, [x0, w4, sxtw #2]
    cmp w2, w3
    blt .Lreturn0
    add w4, w4, #1
.Lloop_check:
    cmp w4, w1
    blt .Lloop
.Lreturn1:
    mov w0, #1
    ret
.Lreturn0:
    mov w0, #0
    ret