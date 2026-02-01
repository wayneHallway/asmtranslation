func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     x19, x0
    mov     x20, x1
    mov     w21, 0
.Lloop:
    ldrb    w0, [x19]
    cbz     w0, .Lend
    sxtb    w0, w0
    bl      ___toupper
    cmp     w0, 0
    beq     .Lstore
    bl      ___tolower
.Lstore:
    cmp     w0, 'A'
    blt     .Lskip
    cmp     w0, 'Z'
    bgt     .Lskip
    add     w0, w0, 2
.Lskip:
    strb    w0, [x20]
    add     x20, x20, 1
    add     x19, x19, 1
    add     w21, w21, 1
    b       .Lloop
.Lend:
    strb    wzr, [x20]
    mov     w0, w21
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 24]
    ldr     x21, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret