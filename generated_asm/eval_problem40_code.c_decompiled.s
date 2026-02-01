func0:
    stp     x29, x30, [sp, -32]!
    mov     x29, sp
    str     w0, [x29, 28]
    mov     w0, 1
    str     w0, [x29, 24]
    mov     w0, 2
    str     w0, [x29, 20]
    mov     w0, 0
    str     w0, [x29, 16]
    str     w0, [x29, 12]
    b       .L2
.L5:
    ldr     w0, [x29, 16]
    ldr     w1, [x29, 28]
    cmp     w0, w1
    bge     .L3
    ldr     w0, [x29, 12]
    add     w0, w0, 1
    str     w0, [x29, 12]
    ldr     w0, [x29, 20]
    str     w0, [x29, 24]
    ldr     w0, [x29, 16]
    str     w0, [x29, 20]
    ldr     w1, [x29, 24]
    ldr     w0, [x29, 20]
    add     w0, w1, w0
    str     w0, [x29, 16]
    b       .L2
.L3:
    ldr     w0, [x29, 20]
    str     w0, [x29, 24]
    ldr     w0, [x29, 16]
    str     w0, [x29, 20]
    ldr     w1, [x29, 24]
    ldr     w0, [x29, 20]
    add     w0, w1, w0
    str     w0, [x29, 16]
    ldr     w0, [x29, 12]
    sub     w0, w0, 1
    str     w0, [x29, 12]
.L2:
    ldr     w0, [x29, 16]
    ldr     w1, [x29, 28]
    cmp     w0, w1
    bne     .L5
    ldr     w0, [x29, 16]
    ldp     x29, x30, [sp], 32
    ret