func0:
    ldr     x2, [x0]
    mov     x3, x2
    cmp     w1, 3
    b.lt    .Ldone
    tbnz    w1, #0, .Lloop_init
    sub     w1, w1, #1
.Lloop_init:
    mov     w4, 1
    b       .Lcond
.Lloop:
    ldr     x5, [x0, x4, lsl 3]
    add     x6, x4, #1
    ldr     x6, [x0, x6, lsl 3]
    add     x5, x5, x6
    cmp     x3, x5
    csel    x3, x3, x5, ge
    add     w4, w4, 2
.Lcond:
    cmp     w4, w1
    b.lt    .Lloop
.Ldone:
    mov     x0, x3
    ret