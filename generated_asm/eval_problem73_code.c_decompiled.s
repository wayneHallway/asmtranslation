func0:
    sub     sp, sp, #32
    str     x19, [sp, #16]
    str     x20, [sp, #24]
    mov     w19, w2
    mov     w20, w3
    mov     w9, #0
    str     w9, [sp, #12]
    str     w9, [sp, #8]
    sub     w10, w1, #1
    mov     w11, #0
    sub     w12, w1, #2
    cmp     w11, w12
    b.ge    .Lcheck_middle
.Lloop:
    ldrsw   x13, [x0, w11, sxtw #2]
    ldrsw   x14, [x0, w10, sxtw #2]
    cmp     w13, w14
    b.ne    .Lloop_update
    ldr     w15, [sp, #12]
    add     w15, w15, w13, lsl #1
    str     w15, [sp, #12]
.Lloop_update:
    add     w11, w11, #1
    sub     w10, w10, #1
    cmp     w11, w12
    b.lt    .Lloop
.Lcheck_middle:
    tst     w1, #1
    b.eq    .Lcheck_sum
    ldrsw   x13, [x0, w11, sxtw #2]
    ldr     w15, [sp, #12]
    add     w15, w15, w13
    str     w15, [sp, #12]
.Lcheck_sum:
    ldr     w15, [sp, #12]
    cmp     w15, w19
    b.gt    .Lfalse
    mov     w0, #1
    b       .Ldone
.Lfalse:
    mov     w0, #0
.Ldone:
    ldr     x19, [sp, #16]
    ldr     x20, [sp, #24]
    add     sp, sp, #32
    ret