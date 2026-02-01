func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        stp     x19, x20, [sp, 16]
        stp     x21, x22, [sp, 32]
        mov     w19, w0
        mov     w20, w1
        mov     x21, x2
        cmp     w19, 0
        bgt     .L2
        strb    wzr, [x21]
        b       .L3
.L2:
        mov     x22, x21
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
.L4:
        sdiv    w1, w19, w20
        msub    w19, w1, w20, w19
        ldrb    w19, [x0, w19, uxtw]
        strb    w19, [x22], 1
        mov     w19, w1
        cmp     w1, 0
        bgt     .L4
        strb    wzr, [x22]
        mov     x0, x21
        sub     x1, x22, #1
        cmp     x0, x1
        bge     .L3
.L6:
        ldrb    w2, [x0]
        ldrb    w3, [x1]
        strb    w3, [x0], 1
        strb    w2, [x1], -1
        cmp     x0, x1
        blt     .L6
.L3:
        ldp     x19, x20, [sp, 16]
        ldp     x21, x22, [sp, 32]
        ldp     x29, x30, [sp], 48
        ret
.LC0:
        .string "0123456789abcdef"