func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        stp     x19, x20, [sp, 16]
        stp     x21, x22, [sp, 32]
        mov     x19, x0
        mov     w20, w1
        mov     x21, x0
        bl      strlen
        mov     x22, x0
        cbz     x22, .L1
        cmp     w20, 0
        cset    w20, eq
        mov     x0, 0
.L3:
        ldrb    w1, [x19, x0]
        cbz     w20, .L4
        sub     w1, w1, #92
.L4:
        add     w1, w1, 26
        mov     w2, 26
        sdiv    w3, w1, w2
        msub    w1, w3, w2, w1
        add     w1, w1, 97
        strb    w1, [x19, x0]
        add     x0, x0, 1
        cmp     x22, x0
        bne     .L3
.L1:
        ldp     x19, x20, [sp, 16]
        ldp     x21, x22, [sp, 32]
        ldp     x29, x30, [sp], 48
        ret