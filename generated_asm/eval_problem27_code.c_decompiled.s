func0:
    stp     x29, x30, [sp, -80]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    mov     x29, sp
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    lsl     w22, w20, 2
    mov     w0, w22
    bl      malloc
    mov     x23, x0
    mov     w1, 4
    mov     w0, w20
    bl      calloc
    mov     x24, x0
    mov     w1, 4
    mov     w0, w20
    bl      calloc
    mov     x25, x0
    mov     w26, 0
    b       .L2
.L7:
    ldr     w0, [x19, w26, sxtw 2]
    mov     w1, 0
    b       .L3
.L5:
    ldr     w2, [x25, w1, sxtw 2]
    cmp     w0, w2
    beq     .L4
    add     w1, w1, 1
.L3:
    cmp     w1, w26
    blt     .L5
.L4:
    cmp     w1, w26
    bge     .L6
    str     w26, [x23, w1, sxtw 2]
    b       .L8
.L6:
    str     w26, [x23, w26, sxtw 2]
.L8:
    add     w26, w26, 1
.L2:
    cmp     w26, w20
    blt     .L7
    ldr     w0, [x23]
    str     w0, [x21]
    mov     x0, x25
    bl      free
    mov     x0, x24
    bl      free
    mov     x0, x23
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret