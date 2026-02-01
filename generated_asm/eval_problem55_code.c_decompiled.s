func0:
        stp     x29, x30, [sp, -32]!
        mov     x29, sp
        stp     x19, x20, [sp, 16]
        mov     x19, x0
        mov     x20, x1
        bl      strlen
        mov     x19, x0
        mov     x0, x20
        bl      strlen
        cmp     x19, x0
        bne     .Lfalse
        mov     x2, x19
        mov     x1, x20
        mov     x0, x19
        bl      strncmp
        cmp     w0, 0
        cset    w0, eq
        b       .Lexit
.Lfalse:
        mov     w0, 0
.Lexit:
        ldp     x19, x20, [sp, 16]
        ldp     x29, x30, [sp], 32
        ret