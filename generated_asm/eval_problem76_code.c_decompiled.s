func0:
        cmp     w0, 3
        b.ge    .LBB0_2
        mov     w0, wzr
        ret
.LBB0_2:
        mov     w8, wzr
        mov     w9, 2
.LBB0_3:
        mul     w10, w9, w9
        cmp     w10, w0
        b.gt    .LBB0_7
        sdiv    w11, w0, w9
        msub    w11, w11, w9, w0
        cmp     w11, wzr
        b.ne    .LBB0_6
        add     w8, w8, 1
.LBB0_6:
        add     w9, w9, 1
        b       .LBB0_3
.LBB0_7:
        cmp     w8, 3
        cset    w0, eq
        ret