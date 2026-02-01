func0:
    sub     sp, sp, #32
    str     x19, [sp, #16]
    str     x20, [sp, #24]
    mov     w9, #0
    str     w9, [sp, #12]
    mov     w10, #0
    str     w10, [sp, #8]
    b       .L2
.L6:
    ldr     w10, [sp, #8]
    add     w11, w10, #1
    str     w11, [sp, #4]
    b       .L3
.L5:
    ldr     w11, [sp, #8]
    sxtw    x12, w11
    lsl     x12, x12, #2
    add     x12, x0, x12
    ldr     w12, [x12]
    ldr     w13, [sp, #4]
    sxtw    x14, w13
    lsl     x14, x14, #2
    add     x14, x0, x14
    ldr     w14, [x14]
    cmp     w12, w14
    beq     .L4
    ldr     w15, [sp, #12]
    add     w15, w15, #1
    str     w15, [sp, #12]
.L4:
    ldr     w16, [sp, #4]
    add     w16, w16, #1
    str     w16, [sp, #4]
.L3:
    ldr     w16, [sp, #4]
    cmp     w16, w1
    blt     .L5
    ldr     w17, [sp, #8]
    add     w17, w17, #1
    str     w17, [sp, #8]
.L2:
    ldr     w17, [sp, #8]
    sub     w18, w1, #1
    cmp     w17, w18
    blt     .L6
    ldr     w0, [sp, #12]
    ldr     x19, [sp, #16]
    ldr     x20, [sp, #24]
    add     sp, sp, #32
    ret