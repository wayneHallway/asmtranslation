func0:
    sub     sp, sp, #80
    str     x0, [sp, #72]
    str     x1, [sp, #64]
    str     wzr, [sp, #60]
    str     wzr, [sp, #56]
    str     wzr, [sp, #52]
    str     wzr, [sp, #48]
    str     wzr, [sp, #44]
    str     wzr, [sp, #40]
    str     wzr, [sp, #36]
    str     wzr, [sp, #32]
    str     wzr, [sp, #28]
    str     wzr, [sp, #24]
    str     wzr, [sp, #20]
    str     wzr, [sp, #16]
    str     wzr, [sp, #12]
    str     wzr, [sp, #8]
    str     wzr, [sp, #4]
    str     wzr, [sp]
    ldr     x0, [sp, #72]
    ldrb    w0, [x0]
    cbz     w0, .L1
    ldr     x0, [sp, #72]
    ldrb    w0, [x0]
    cmp     w0, 32
    beq     .L1
    ldr     w0, [sp, #56]
    cbnz    w0, .L1
    cmp     w0, 1
    bne     .L1
    cmp     w0, 2
    bne     .L1
    cmp     w0, 3
    bne     .L1
    cmp     w0, 4
    bne     .L1
    cmp     w0, 5
    bne     .L1
    cmp     w0, 6
    bne     .L1
    cmp     w0, 7
    bne     .L1
    cmp     w0, 8
    bne     .L1
    cmp     w0, 9
    bne     .L1
    cmp     w0, 10
    bne     .L1
    cmp     w0, 11
    bne     .L1
    cmp     w0, 12
    bne     .L1
    cmp     w0, 13
    bne     .L1
    cmp     w0, 14
    bne     .L1
    cmp     w0, 15
    bne     .L1
    cmp     w0, 16
    bne     .L1
    cmp     w0, 17
    bne     .L1
    cmp     w0, 18
    bne     .L1
    cmp     w0, 19
    bne     .L1
    cmp     w0, 20
    bne     .L1
    cmp     w0, 21
    bne     .L1
    cmp     w0, 22
    bne     .L1
    cmp     w0, 23
    bne     .L1
    cmp     w0, 24
    bne     .L1
    cmp     w0, 25
    bne     .L1
    cmp     w0, 26
    bne     .L1
    cmp     w0, 27
    bne     .L1
    cmp     w0, 28
    bne     .L1
    cmp     w0, 29
    bne     .L1
    cmp     w0, 30
    bne     .L1
    cmp     w0, 31
    bne     .L1
.L1:
    add     sp, sp, #80
    ret