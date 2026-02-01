func0:
        stp     x29, x30, [sp, -48]!
        mov     x29, sp
        str     x19, [sp, 16]
        adrp    x8, __stack_chk_guard
        ldr     x8, [x8, :lo12:__stack_chk_guard]
        str     x8, [x29, 40]
        mov     w19, w0
        cmp     w0, 2
        bgt     .L2
        mov     w0, 1
        b       .L3
.L2:
        mov     w9, 1
        mov     w10, 1
        mov     w11, 1
        mov     w12, 2
        b       .L4
.L5:
        add     w0, w10, w11
        add     w10, w11, w0
        add     w11, w0, w10
        mov     w9, w0
        add     w12, w12, 1
.L4:
        add     w13, w19, 1
        cmp     w12, w13
        blt     .L5
        adrp    x8, __stack_chk_guard
        ldr     x8, [x8, :lo12:__stack_chk_guard]
        ldr     x1, [x29, 40]
        cmp     x1, x8
        bne     .L8
        mov     w0, w9
.L3:
        ldr     x19, [sp, 16]
        ldp     x29, x30, [sp], 48
        ret
.L8:
        bl      abort