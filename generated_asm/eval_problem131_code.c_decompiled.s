func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 32]
    mov     w19, w0
    add     w0, w19, 1
    sxtw    x0, w0
    lsl     x0, x0, 2
    bl      malloc
    mov     x20, x0
    mov     w1, 1
    str     w1, [x20]
    cbz     w19, .Lreturn
    mov     w1, 3
    str     w1, [x20, 4]
    cmp     w19, 1
    ble     .Lreturn
    mov     w1, 2
    b       .Lloop_check
.Lloop:
    sub     w2, w1, 1
    ldr     w3, [x20, w2, sxtw 2]
    asr     w2, w1, 1
    ldr     w4, [x20, w2, sxtw 2]
    add     w2, w3, w4
    mov     w3, 3
    sdiv    w4, w2, w3
    msub    w2, w4, w3, w2
    str     w2, [x20, w1, sxtw 2]
    add     w1, w1, 1
.Lloop_check:
    cmp     w1, w19
    ble     .Lloop
.Lreturn:
    mov     x0, x20
    ldr     x20, [sp, 32]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret