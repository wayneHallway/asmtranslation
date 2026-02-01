func0:
    stp     x29, x30, [sp, -432]!
    mov     x29, sp
    str     x19, [sp, 16]
    mov     w19, w0
    adrp    x0, stack_chk_guard
    ldr     x0, [x0, #:lo12:stack_chk_guard]
    str     x0, [x29, 424]
    mov     w0, 0
    add     x1, x29, 24
.L2:
    str     w0, [x1], 4
    cmp     x1, x29
    bne     .L2
    mov     w0, 1
    str     w0, [x29, 20]
    ldr     w1, [x29, 24]
    str     w1, [x29, 12]
    str     w1, [x29, 8]
    mov     w0, 1
    b       .L3
.L4:
    sxtw    x1, w0
    lsl     x1, x1, 2
    add     x1, x29, x1
    ldr     w2, [x1, 24]
    ldr     w3, [x29, 20]
    add     w3, w3, w2
    str     w3, [x29, 20]
    ldr     w4, [x29, 12]
    add     w4, w4, w2
    str     w4, [x29, 12]
    add     w2, w3, w2
    str     w2, [x1, 24]
    add     w4, w4, w2
    str     w4, [x29, 12]
    add     w0, w0, 1
.L3:
    cmp     w0, 3
    ble     .L4
    sxtw    x0, w19
    lsl     x0, x0, 2
    add     x0, x29, x0
    ldr     w0, [x0, 24]
    str     w0, [x29, 20]
    adrp    x0, stack_chk_guard
    ldr     x0, [x0, #:lo12:stack_chk_guard]
    ldr     x1, [x29, 424]
    cmp     x1, x0
    bne     .L7
    ldr     w0, [x29, 20]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 432
    ret
.L7:
    bl      abort