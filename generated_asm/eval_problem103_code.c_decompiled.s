func0:
    cmp     w1, w0
    blt     .Lless
    beq     .Lequal
    tst     w1, #0x80000000
    beq     .Lpositive
    cmp     w1, w0
    beq     .Lreturn_one
    mov     w0, #0
    ret
.Lpositive:
    cmp     w1, w0
    beq     .Lreturn_zero
    mov     w0, #1
    ret
.Lless:
    mov     w0, #-1
    ret
.Lequal:
    mov     w0, #0
    ret
.Lreturn_one:
    mov     w0, #1
    ret
.Lreturn_zero:
    mov     w0, #0
    ret