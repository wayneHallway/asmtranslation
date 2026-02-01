func0:
    stp     x29, x30, [sp, -64]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    mov     x29, sp
    mov     x19, x0
    mov     w20, w1
    mov     w21, 0
    mov     w22, 0
    cmp     w20, 0
    ble     .L2
.L3:
    ldr     x0, [x19, x22, lsl 3]
    bl      strlen
    add     w21, w21, w0
    add     w22, w22, 1
    cmp     w22, w20
    blt     .L3
.L2:
    add     w21, w21, 1
    sxtw    x0, w21
    bl      malloc
    mov     x23, x0
    cbz     x0, .L4
    strb    wzr, [x0]
    mov     w24, 0
    cmp     w20, 0
    ble     .L4
.L5:
    ldr     x1, [x19, x24, lsl 3]
    mov     x0, x23
    bl      strcat
    add     w24, w24, 1
    cmp     w24, w20
    blt     .L5
.L4:
    mov     x0, x23
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x29, x30, [sp], 64
    ret