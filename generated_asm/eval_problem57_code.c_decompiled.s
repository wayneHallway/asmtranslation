func0:
    stp     x29, x30, [sp, -32]!
    mov     x29, sp
    str     x19, [sp, 16]
    mov     x19, x0
    mov     w0, 0
    mov     w1, 0
.Lloop:
    ldrb    w2, [x19]
    cbz     w2, .Lend
    cmp     w2, 60
    bne     .Lcheck_gt
    add     w1, w1, 1
    b       .Linc
.Lcheck_gt:
    cmp     w2, 62
    bne     .Linc
    sub     w1, w1, 1
.Linc:
    add     x19, x19, 1
    tbnz    w1, #31, .Ldepth_neg
    b       .Lloop
.Ldepth_neg:
    mov     w0, 0
    b       .Lreturn
.Lend:
    cmp     w1, 0
    cset    w0, eq
.Lreturn:
    ldr     x19, [sp, 16]
    ldp     x29, x30, [sp], 32
    ret