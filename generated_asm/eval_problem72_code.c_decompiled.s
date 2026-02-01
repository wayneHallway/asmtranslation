func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        stp     s0, s1, [sp, 16]
        str     s2, [sp, 24]
        ldr     s0, [sp, 20]
        ldr     s1, [sp, 20]
        bl      powf
        str     s0, [sp, 28]
        ldr     s0, [sp, 16]
        ldr     s1, [sp, 24]
        fmul    s0, s0, s1
        fmov    s1, 4.0
        fmul    s0, s1, s0
        ldr     s1, [sp, 28]
        fsub    s0, s1, s0
        str     s0, [sp, 32]
        fmov    s1, wzr
        fcmp    s0, s1
        bpl     .L2
        fmov    s0, wzr
        b       .L3
.L2:
        ldr     s0, [sp, 32]
        bl      sqrtf
        str     s0, [sp, 36]
        ldr     s0, [sp, 20]
        fneg    s0, s0
        ldr     s1, [sp, 36]
        fadd    s0, s0, s1
        str     s0, [sp, 40]
        ldr     s0, [sp, 16]
        fmov    s1, 2.0
        fmul    s0, s1, s0
        str     s0, [sp, 44]
        ldr     s0, [sp, 40]
        ldr     s1, [sp, 44]
        fdiv    s0, s0, s1
.L3:
        ldp     x29, x30, [sp], 48
        ret