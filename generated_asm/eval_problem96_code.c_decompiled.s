func0:
    sub     sp, sp, #48
    str     x19, [sp, #16]
    stp     x29, x30, [sp, #32]
    add     x29, sp, #32
    mov     w19, w1
    cbz     w1, .Lreturn0
    cmp     w1, #1
    b.lt    .Lreturn1
    mov     w1, #0
.Lloop:
    cmp     w1, w19
    b.ge    .Lreturn1
    ldrb    w0, [x0, w1, sxtw]
    cbz     w0, .Lreturn0
    tbnz    w0, #31, .Lreturn1
    tst     w0, #0x100
    b.ne    .Lreturn1
    tst     w0, #0x8000
    b.ne    .Lreturn1
    tst     w0, #0x1000
    b.ne    .Lreturn1
    tst     w0, #0x10000
    b.ne    .Lreturn1
    tst     w0, #0x100000
    b.ne    .Lreturn1
    tst     w0, #0x1000000
    b.ne    .Lreturn1
    tst     w0, #0x10000000
    b.ne    .Lreturn1
    add     w1, w1, #1
    b       .Lloop
.Lreturn0:
    mov     w0, #0
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp, #32]
    add     sp, sp, #48
    ret
.Lreturn1:
    mov     w0, #1
    ldr     x19, [sp, #16]
    ldp     x29, x30, [sp, #32]
    add     sp, sp, #48
    ret