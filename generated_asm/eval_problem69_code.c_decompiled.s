func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    mov     w22, 2147483647
    mov     w9, -1
    str     w9, [sp, 12]
    mov     w9, 0
    str     w9, [sp, 8]
    b       .L2
.L10:
    ldrsw   x10, [sp, 8]
    lsl     x10, x10, 2
    add     x10, x19, x10
    ldr     w11, [x10]
    mov     w0, w11
    bl      is_even
    cmp     w0, 0
    beq     .L3
    ldrsw   x10, [sp, 8]
    lsl     x10, x10, 2
    add     x10, x19, x10
    ldr     w11, [x10]
    cmp     w11, w22
    bge     .L4
    ldrsw   x10, [sp, 8]
    lsl     x10, x10, 2
    add     x10, x19, x10
    ldr     w22, [x10]
.L4:
    ldr     w10, [sp, 12]
    cmn     w10, #1
    bne     .L3
    ldr     w10, [sp, 8]
    str     w10, [sp, 12]
.L3:
    ldr     w10, [sp, 8]
    add     w10, w10, 1
    lsl     w10, w10, 2
    sxtw    x10, w10
    add     x10, x19, x10
    ldr     w11, [x10]
    mov     w0, w11
    bl      is_even
    cmp     w0, 0
    beq     .L6
    ldr     w10, [sp, 8]
    add     w10, w10, 1
    lsl     w10, w10, 2
    sxtw    x10, w10
    add     x10, x19, x10
    ldr     w11, [x10]
    cmp     w11, w22
    bge     .L7
    ldr     w10, [sp, 8]
    add     w10, w10, 1
    lsl     w10, w10, 2
    sxtw    x10, w10
    add     x10, x19, x10
    ldr     w22, [x10]
.L7:
    ldr     w10, [sp, 12]
    cmn     w10, #1
    bne     .L6
    ldr     w10, [sp, 8]
    add     w10, w10, 1
    str     w10, [sp, 12]
.L6:
    ldr     w10, [sp, 8]
    add     w10, w10, 2
    str     w10, [sp, 8]
.L2:
    ldr     w10, [sp, 8]
    cmp     w10, w20
    blt     .L10
    str     w22, [x21]
    ldr     w10, [sp, 12]
    str     w10, [x21, 4]
    mov     w0, 0
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret