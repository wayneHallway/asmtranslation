func0:
        cmp     x0, #3
        b.ge    .LBB0_2
        mov     w0, #0
        ret
.LBB0_2:
        mov     x8, #2
.LBB0_3:
        mul     x9, x8, x8
        cmp     x9, x0
        b.gt    .LBB0_7
        sdiv    x10, x0, x8
        msub    x10, x10, x8, x0
        cmp     x10, #0
        b.ne    .LBB0_6
        mov     w0, #1
        ret
.LBB0_6:
        add     x8, x8, #1
        b       .LBB0_3
.LBB0_7:
        mov     w0, #0
        ret