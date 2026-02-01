func0:
        sub     sp, sp, #32
        str     x19, [sp, #16]
        str     x30, [sp, #24]
        mov     w19, #-1
        cmp     w1, #3
        b.lt    .Lreturn
        sub     w2, w1, #2
        mov     w3, #0
.Lloop:
        ldr     w4, [x0, w3, sxtw #2]
        add     w5, w3, #1
        ldr     w6, [x0, w5, sxtw #2]
        cmp     w4, w6
        b.ge    .Lnext
        add     w7, w3, #2
        ldr     w8, [x0, w7, sxtw #2]
        cmp     w6, w8
        b.ge    .Lnext
        mov     w19, w3
.Lnext:
        add     w3, w3, #1
        cmp     w3, w2
        b.lt    .Lloop
.Lreturn:
        mov     w0, w19
        ldr     x19, [sp, #16]
        ldr     x30, [sp, #24]
        add     sp, sp, #32
        ret