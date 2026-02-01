func0:
    stp     x29, x30, [sp, -64]!
    mov     x29, sp
    str     x0, [x29, 40]
    str     w1, [x29, 36]
    mov     w0, 1
    str     w0, [x29, 56]
    str     w0, [x29, 52]
    str     w0, [x29, 48]
    str     w0, [x29, 44]
    str     w0, [x29, 60]
    str     w0, [x29, 28]
    str     wzr, [x29, 56]
    b       .L2
.L9:
    str     wzr, [x29, 52]
    b       .L3
.L8:
    ldr     w0, [x29, 56]
    ldr     w1, [x29, 36]
    mul     w0, w0, w1
    ldr     w1, [x29, 52]
    add     w0, w0, w1
    sxtw    x0, w0
    lsl     x0, x0, 2
    ldr     x1, [x29, 40]
    add     x0, x1, x0
    ldr     s0, [x0]
    ldr     w0, [x29, 56]
    add     w0, w0, 1
    ldr     w1, [x29, 36]
    mul     w0, w0, w1
    ldr     w1, [x29, 52]
    add     w0, w0, w1
    sxtw    x0, w0
    lsl     x0, x0, 2
    ldr     x1, [x29, 40]
    add     x0, x1, x0
    ldr     s1, [x0]
    fcmp    s0, s1
    bge     .L4
    mov     w0, 1
    str     w0, [x29, 60]
.L4:
    ldr     w0, [x29, 56]
    ldr     w1, [x29, 36]
    mul     w0, w0, w1
    ldr     w1, [x29, 52]
    add     w0, w0, w1
    sxtw    x0, w0
    lsl     x0, x0, 2
    ldr     x1, [x29, 40]
    add     x0, x1, x0
    ldr     s0, [x0]
    ldr     w0, [x29, 56]
    ldr     w1, [x29, 36]
    mul     w0, w0, w1
    ldr     w1, [x29, 52]
    add     w1, w1, 1
    add     w0, w0, w1
    sxtw    x0, w0
    lsl     x0, x0, 2
    ldr     x1, [x29, 40]
    add     x0, x1, x0
    ldr     s1, [x0]
    fcmp    s0, s1
    bge     .L5
    mov     w0, 1
    str     w0, [x29, 28]
.L5:
    ldr     w0, [x29, 56]
    ldr     w1, [x29, 36]
    mul     w0, w0, w1
    ldr     w1, [x29, 52]
    add     w0, w0, w1
    sxtw    x0, w0
    lsl     x0, x0, 2
    ldr     x1, [x29, 40]
    add     x0, x1, x0
    ldr     s0, [x0]
    ldr     w0, [x29, 56]
    add     w0, w0, 1
    ldr     w1, [x29, 36]
    mul     w0, w0, w1
    ldr     w1, [x29, 52]
    add     w1, w1, 1
    add     w0, w0, w1
    sxtw    x0, w0
    lsl     x0, x0, 2
    ldr     x1, [x29, 40]
    add     x0, x1, x0
    ldr     s1, [x0]
    fcmp    s0, s1
    bge     .L6
    mov     w0, 1
    str     w0, [x29, 44]
.L6:
    ldr     w0, [x29, 52]
    add     w0, w0, 1
    str     w0, [x29, 52]
.L3:
    ldr     w1, [x29, 36]
    sub     w1, w1, #2
    ldr     w0, [x29, 52]
    cmp     w0, w1
    blt     .L8
    ldr     w0, [x29, 56]
    add     w0, w0, 1
    str     w0, [x29, 56]
.L2:
    ldr     w1, [x29, 36]
    sub     w1, w1, #2
    ldr     w0, [x29, 56]
    cmp     w0, w1
    blt     .L9
    ldr     w1, [x29, 60]
    ldr     w0, [x29, 28]
    add     w0, w1, w0
    cmp     w0, 2
    bne     .L10
    mov     w0, 1
    b       .L11
.L10:
    mov     w0, 0
.L11:
    ldp     x29, x30, [sp], 64
    ret