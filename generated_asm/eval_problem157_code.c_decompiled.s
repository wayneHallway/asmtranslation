func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x19, [sp, 16]
        str     x20, [sp, 32]
        mov     w19, w0
        mov     x20, x1
        strb    wzr, [x20]
        adrp    x0, reltable
        add     x0, x0, :lo12:reltable
        str     x0, [sp, 40]
        mov     w0, 0
        b       .L2
.L5:
        ldr     x1, [sp, 40]
        ldr     w2, [x1, x0, lsl 3]
        cmp     w19, w2
        blt     .L3
        ldr     x1, [sp, 40]
        add     x1, x1, x0, lsl 3
        add     x1, x1, 4
        mov     x0, x20
        bl      strcat
        ldr     x1, [sp, 40]
        ldr     w1, [x1, x0, lsl 3]
        sub     w19, w19, w1
        ldr     x0, [sp, 40]
        ldr     w0, [x0, x0, lsl 3]
.L3:
        add     w0, w0, 1
.L2:
        cmp     w19, 0
        ble     .L1
        ldr     x1, [sp, 40]
        ldr     w1, [x1, x0, lsl 3]
        cmp     w1, 0
        bne     .L5
.L1:
        ldr     x20, [sp, 32]
        ldr     x19, [sp, 16]
        ldp     x29, x30, [sp], 48
        ret