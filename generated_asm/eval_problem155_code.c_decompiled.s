func0:
    stp     x29, x30, [sp, -80]!
    stp     x20, x21, [sp, 16]
    stp     x22, x23, [sp, 32]
    stp     x24, x25, [sp, 48]
    stp     x26, x27, [sp, 64]
    mov     x29, sp
    mov     x20, x0
    mov     x21, x1
    mov     x0, x1
    bl      strlen
    mov     w22, w0
    lsl     w23, w22, 1
    add     w0, w23, 1
    sxtw    x0, w0
    bl      malloc
    mov     x24, x0
    mov     w25, 0
    mov     w26, 0
    mov     w27, 0
    mov     w19, 0
    b       .L2
.L7:
    mov     w27, w25
    mov     w19, 1
    mov     w26, 0
    b       .L3
.L6:
    add     x0, x24, x26
    add     x1, x21, x25
    mov     w2, 1
    bl      strncpy
    add     w0, w26, w27
    sxtw    x0, w0
    add     x0, x24, x0
    add     x1, x21, x26
    mov     w2, 1
    bl      strncpy
    add     w0, w26, w27
    sxtw    x0, w0
    strb    wzr, [x24, x0]
    mov     x0, x20
    mov     x1, x24
    bl      strstr
    cmp     x0, 0
    bne     .L4
    mov     w19, 0
    b       .L5
.L4:
    add     w26, w26, 1
.L3:
    cmp     w26, w22
    blt     .L6
.L5:
    add     w25, w25, 1
.L2:
    cmp     w25, w22
    blt     .L7
    mov     x0, x24
    bl      free
    mov     w0, w19
    ldp     x20, x21, [sp, 16]
    ldp     x22, x23, [sp, 32]
    ldp     x24, x25, [sp, 48]
    ldp     x26, x27, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret