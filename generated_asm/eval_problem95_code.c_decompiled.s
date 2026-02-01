func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    mov     w19, 0
    str     x0, [x29, 32]
    str     w1, [x29, 28]
    str     w2, [x29, 24]
    str     wzr, [x29, 40]
.Lloop_check:
    ldr     w0, [x29, 40]
    ldr     w1, [x29, 28]
    cmp     w0, w1
    bge     .Lloop_end
    ldr     x0, [x29, 32]
    ldrsw   x1, [x29, 40]
    ldr     w0, [x0, x1, lsl 2]
    str     w0, [x29, 36]
    ldr     w0, [x29, 36]
    cmp     w0, 2
    ble     .Lcontinue
    ldr     w0, [x29, 36]
    cmp     w0, 4
    ble     .Lmid
    ldr     w0, [x29, 36]
    add     w19, w19, w0
    b       .Lcontinue
.Lmid:
    ldr     w0, [x29, 36]
    bl      get_max_divider
    add     w19, w19, w0
.Lcontinue:
    ldr     w0, [x29, 40]
    add     w0, w0, 1
    str     w0, [x29, 40]
    b       .Lloop_check
.Lloop_end:
    mov     w0, w19
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret