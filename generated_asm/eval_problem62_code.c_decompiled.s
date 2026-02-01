func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 32]
    mov     x19, x0
    bl      strlen
    mov     w20, w0
    cbz     w20, .Lreturn0
    ldrb    w1, [x19]
    mov     w0, 0
    cmp     w1, '('
    bne     .Lcheck_close
    mov     w0, 1
    b       .Lafter_first
.Lcheck_close:
    cmp     w1, ')'
    bne     .Lafter_first
    mov     w0, -1
.Lafter_first:
    tbnz    w0, #31, .Lreturn0
    mov     w1, 1
    b       .Lloop_check
.Lloop:
    ldrb    w2, [x19, w1, sxtw]
    cmp     w2, '('
    bne     .Lloop_check_close
    add     w0, w0, 1
    b       .Lloop_after
.Lloop_check_close:
    cmp     w2, ')'
    bne     .Lloop_after
    sub     w0, w0, 1
.Lloop_after:
    tbnz    w0, #31, .Lreturn0
    add     w1, w1, 1
.Lloop_check:
    cmp     w1, w20
    ble     .Lloop
    mov     w0, 1
    b       .Lreturn
.Lreturn0:
    mov     w0, 0
.Lreturn:
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret