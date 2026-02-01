func0:
    sub     sp, sp, #16
    str     w0, [sp, #12]
    str     w1, [sp, #8]
    ldr     w1, [sp, #8]
    cbz     w1, .L2
    ldr     w0, [sp, #12]
    ldr     w1, [sp, #8]
    sdiv    w2, w0, w1
    msub    w1, w2, w1, w0
    ldr     w0, [sp, #8]
    bl      func0
    b       .L3
.L2:
    ldr     w0, [sp, #12]
.L3:
    add     sp, sp, #16
    ret