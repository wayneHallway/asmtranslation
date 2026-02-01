func0:
        sub     sp, sp, #48
        str     x19, [sp, #16]
        stp     x29, x30, [sp, #32]
        add     x29, sp, #32
        mov     w19, w1
        cbz     w1, .Ltrue
        ldr     w8, [x0]
        mov     w9, wzr
        mov     w10, wzr
        b       .Lcheck
.Lloop:
        ldr     w11, [x0, w9, sxtw #2]
        cmp     w11, w8
        bge     .Lskip
        add     w10, w10, #1
.Lskip:
        add     w9, w9, #1
.Lcheck:
        cmp     w9, w19
        blt     .Lloop
        cmp     w19, #1
        beq     .Ltrue
        cmp     w10, #1
        ble     .Ltrue
        mov     w0, wzr
        b       .Lexit
.Ltrue:
        mov     w0, #1
.Lexit:
        ldr     x19, [sp, #16]
        ldp     x29, x30, [sp, #32]
        add     sp, sp, #48
        ret