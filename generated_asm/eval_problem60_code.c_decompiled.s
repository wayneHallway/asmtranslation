func0:
    stp     x29, x30, [sp, -16]!
    mov     x29, sp
    cmp     w0, 4
    bgt     .Lelse
    b       .Lreturn
.Lelse:
    mov     w1, w0
    bl      func0
    sdiv    w1, w1, w0
    mov     w0, w1
    bl      func0
.Lreturn:
    ldp     x29, x30, [sp], 16
    ret