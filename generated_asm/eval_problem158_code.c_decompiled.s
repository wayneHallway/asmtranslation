func0:
        stp     x29, x30, [sp, -16]!
        mov     x29, sp
        fmov    w0, s0
        fmov    w1, s1
        fmov    w2, s2
        orr     w3, w0, w1
        orr     w3, w3, w2
        tst     w3, 0x7fffffff
        beq     .L2
        mov     w0, 1
        b       .L3
.L2:
        mov     w0, 0
.L3:
        ldp     x29, x30, [sp], 16
        ret