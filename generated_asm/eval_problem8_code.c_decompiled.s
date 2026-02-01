func0:
    stp     x29, x30, [sp, -80]!
    stp     x20, x19, [sp, 16]
    stp     x22, x21, [sp, 32]
    stp     x24, x23, [sp, 48]
    stp     x26, x25, [sp, 64]
    mov     x29, sp
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     x22, x3
    mov     x23, 0
    mov     w24, 0
    mov     w25, 0
    b       .L2
.L5:
    ldr     x0, [x19, x26, lsl 3]
    mov     x1, x21
    bl      strstr
    cmp     x0, 0
    beq     .L3
    add     w0, w24, 1
    sxtw    x1, w0
    mov     x0, x23
    lsl     x1, x1, 3
    bl      realloc
    mov     x23, x0
    ldr     x0, [x19, x26, lsl 3]
    str     x0, [x23, x24, lsl 3]
    add     w24, w24, 1
.L3:
    add     w25, w25, 1
.L2:
    cmp     w25, w20
    bge     .L4
    sxtw    x26, w25
    b       .L5
.L4:
    str     w24, [x22]
    mov     x0, x23
    ldp     x20, x19, [sp, 16]
    ldp     x22, x21, [sp, 32]
    ldp     x24, x23, [sp, 48]
    ldp     x26, x25, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret