func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        stp     x19, x20, [sp, 16]
        stp     x21, x22, [sp, 32]
        mov     w19, w0
        mov     x20, x1
        cmp     w19, 0
        bge     .L2
        neg     w19, w19
.L2:
        mov     w21, 0
        mov     w22, 0
        b       .L3
.L4:
        and     w0, w19, 1
        add     w22, w22, w0
        and     w0, w19, 1
        eor     w0, w0, 1
        add     w21, w21, w0
        mov     w0, w19
        mov     w1, 1717986919
        smull   x0, w0, w1
        lsr     x0, x0, 32
        asr     w1, w0, 1
        add     w0, w1, w19, asr 31
        mov     w19, w0
        asr     w0, w19, 34
        add     w19, w19, w0
.L3:
        cmp     w19, 9
        bgt     .L4
        ldr     x0, [x20]
        str     w21, [x0]
        ldr     x0, [x20, 8]
        str     w22, [x0]
        ldp     x19, x20, [sp, 16]
        ldp     x21, x22, [sp, 32]
        ldp     x29, x30, [sp], 48
        ret