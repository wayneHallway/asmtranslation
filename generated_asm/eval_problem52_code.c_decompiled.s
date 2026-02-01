func0:
    stp     x29, x30, [sp, -32]!
    mov     x29, sp
    str     x19, [sp, 16]
    mov     x19, x0
    mov     x1, x0
    adrp    x2, .Lstr
    add     x2, x2, :lo12:.Lstr
.Lloop:
    ldrb    w0, [x19]
    cbz     w0, .Lend
    mov     x3, x2
.Lsearch:
    ldrb    w4, [x3]
    cmp     w4, 0
    beq     .Lnotfound
    cmp     w0, w4
    beq     .Lfound
    add     x3, x3, 1
    b       .Lsearch
.Lfound:
    add     x19, x19, 1
    b       .Lloop
.Lnotfound:
    strb    w0, [x1], 1
    add     x19, x19, 1
    b       .Lloop
.Lend:
    strb    wzr, [x1]
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 32
    ret
.Lstr:
    .string "AEIOUaeiou"