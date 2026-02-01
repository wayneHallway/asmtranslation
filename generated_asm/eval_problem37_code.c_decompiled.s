func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     w0, [x29, 28]
        str     wzr, [x29, 44]
        str     wzr, [x29, 40]
        b       .L2
.L5:
        ldr     w0, [x29, 40]
        bl      is_prime
        cmp     w0, 0
        beq     .L3
        ldr     w0, [x29, 44]
        add     w0, w0, 1
        str     w0, [x29, 44]
.L3:
        ldr     w0, [x29, 40]
        add     w0, w0, 1
        str     w0, [x29, 40]
.L2:
        ldr     w1, [x29, 40]
        ldr     w0, [x29, 28]
        cmp     w1, w0
        blt     .L5
        ldr     w0, [x29, 44]
        ldp     x29, x30, [sp], 48
        ret