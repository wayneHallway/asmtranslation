func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     x19, x0
    bl      strlen
    mov     x20, x0
    cmp     x20, 4
    b.hs    .LBB0_2
    mov     w0, 0
    b       .LBB0_8
.LBB0_2:
    ldrb    w21, [x19, 1]
    mov     w8, 0
    mov     w9, 0
    mov     w10, 2
    b       .LBB0_4
.LBB0_3:
    add     w10, w10, 1
    cmp     x20, x10
    b.ls    .LBB0_7
.LBB0_4:
    add     x11, x19, x10
    ldrb    w12, [x11]
    cmp     w12, w21
    b.ne    .LBB0_3
    mov     w8, 1
    ldrb    w11, [x11, -1]
    cmp     w11, w21
    b.ne    .LBB0_3
    mov     w9, 1
    b       .LBB0_6
.LBB0_7:
    mov     w0, w8
    b       .LBB0_8
.LBB0_6:
    mov     w0, w9
.LBB0_8:
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 24]
    ldr     x21, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret