func0:
        sub     sp, sp, #48
        str     x19, [sp, 16]
        stp     x29, x30, [sp, 32]
        add     x29, sp, 32
        mov     w19, 0
        str     w19, [x29, -4]
        str     x0, [sp]
        str     w1, [sp, 8]
        str     wzr, [sp, 12]
        ldr     w8, [sp, 8]
        sub     w8, w8, #2
        str     w8, [sp, 16]
        b       .L2
.L7:
        ldr     w8, [sp, 8]
        lsr     w8, w8, 1
        str     w8, [sp, 20]
        str     wzr, [sp, 24]
        b       .L3
.L6:
        ldr     w8, [sp, 12]
        ldr     w9, [sp, 8]
        mul     w8, w8, w9
        ldr     w9, [sp, 24]
        add     w8, w8, w9
        sxtw    x8, w8
        ldr     x9, [sp]
        ldr     w10, [x9, x8, lsl 2]
        str     w10, [sp, 28]
        ldr     w8, [sp, 28]
        and     w8, w8, 1
        cmp     w8, 0
        bne     .L4
        ldr     w8, [sp, 28]
        ldr     w9, [x29, -4]
        add     w8, w9, w8
        str     w8, [x29, -4]
.L4:
        ldr     w8, [sp, 24]
        add     w8, w8, 1
        str     w8, [sp, 24]
.L3:
        ldr     w8, [sp, 24]
        ldr     w9, [sp, 20]
        cmp     w8, w9
        blt     .L6
        ldr     w8, [sp, 12]
        add     w8, w8, 1
        str     w8, [sp, 12]
.L2:
        ldr     w8, [sp, 12]
        ldr     w9, [sp, 16]
        cmp     w8, w9
        blt     .L7
        ldr     w0, [x29, -4]
        ldr     x19, [sp, 16]
        ldp     x29, x30, [sp, 32]
        add     sp, sp, 48
        ret