func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x19, [sp, 16]
        str     x0, [x29, 40]
        ldr     x0, [x29, 40]
        bl      strlen
        str     x0, [x29, 32]
        str     wzr, [x29, 28]
        str     xzr, [x29, 24]
        b       .L2
.L5:
        ldr     x0, [x29, 40]
        ldr     x1, [x29, 24]
        add     x0, x0, x1
        ldrb    w0, [x0]
        mov     w1, w0
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        bl      strchr
        cmp     x0, 0
        beq     .L3
        ldr     w0, [x29, 28]
        add     w0, w0, 1
        str     w0, [x29, 28]
.L3:
        ldr     x0, [x29, 24]
        add     x0, x0, 1
        str     x0, [x29, 24]
.L2:
        ldr     x1, [x29, 24]
        ldr     x0, [x29, 32]
        cmp     x1, x0
        bcc     .L5
        ldr     w0, [x29, 28]
        ldr     x19, [sp, 16]
        ldp     x29, x30, [sp], 48
        ret
.LC0:
        .string "2357BD"