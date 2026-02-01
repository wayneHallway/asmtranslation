func0:
    sub     sp, sp, #32
    str     x30, [sp, #16]
    str     w0, [sp, #12]
    str     x1, [sp]
    str     x2, [sp, #24]
    ldr     w0, [sp, #12]
    ldr     x1, [sp]
    ldr     x2, [sp, #24]
    cmp     x1, #0
    bgt     .L2
    mov     w0, #0
    b       .L3
.L2:
    ldr     w3, [x0]
    cmp     w3, #0
    bge     .L4
    mov     w0, #1
    b       .L3
.L4:
    ldr     x1, [sp]
    mov     x2, #1
    bl      func0
    ldr     w3, [sp, #12]
    ldr     x4, [sp]
    ldr     w3, [x3, x4, lsl #2]
    add     w0, w0, w3
.L3:
    ldr     x30, [sp, #16]
    add     sp, sp, #32
    ret