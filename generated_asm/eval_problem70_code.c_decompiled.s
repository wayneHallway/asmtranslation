func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    mov     x19, x0
    mov     w20, w1
    add     w0, w20, 1
    lsl     w1, w0, 2
    mov     w0, 1
    bl      calloc
    mov     x21, x0
    mov     w22, -1
    mov     w0, 0
    b       .L2
.L4:
    ldrsw   x1, [x19, x0, lsl 2]
    ldr     w2, [x21, x1, lsl 2]
    add     w2, w2, 1
    str     w2, [x21, x1, lsl 2]
    ldr     w1, [x19, x0, lsl 2]
    cmp     w22, w1
    bge     .L3
    ldr     w22, [x19, x0, lsl 2]
.L3:
    add     w0, w0, 1
.L2:
    cmp     w0, w20
    blt     .L4
    mov     x0, x21
    bl      free
    mov     w0, w22
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret