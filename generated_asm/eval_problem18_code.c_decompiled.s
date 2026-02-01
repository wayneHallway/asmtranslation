func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    mov     x19, x0
    mov     x20, x1
    bl      strlen
    add     x0, x0, 2
    bl      malloc
    mov     x21, x0
    mov     x0, x21
    mov     x1, x19
    bl      strcpy
    mov     x0, x21
    bl      strlen
    mov     w22, w0
    add     x1, x21, x22
    mov     w2, 32
    strb    w2, [x1]
    add     x1, x1, 1
    strb    wzr, [x1]
    str     w22, [x20]
    mov     x0, x21
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret