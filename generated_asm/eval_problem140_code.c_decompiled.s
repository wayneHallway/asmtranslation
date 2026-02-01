func0:
        stp     x29, x30, [sp, -16]!
        mov     x29, sp
        cmp     w0, 0
        bgt     .L2
        mov     x0, 1
        b       .L3
.L2:
        stp     x19, x20, [sp, -16]!
        mov     w19, w0
        asr     w0, w0, 3
        bl      func0
        mov     x20, x0
        and     w0, w19, 7
        mul     x20, x20, x0
        add     w0, w19, 8
        mul     x0, x20, x0
        ldp     x19, x20, [sp], 16
.L3:
        ldp     x29, x30, [sp], 16
        ret