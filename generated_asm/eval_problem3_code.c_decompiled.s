func0:
        stp     x29, x30, [sp, -16]!
        mov     x29, sp
        fmov    s0, s0
        bl      floorf
        fsub    s0, s0, s0
        ldp     x29, x30, [sp], 16
        ret