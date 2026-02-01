func0:
    stp     x29, x30, [sp, -112]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    stp     x27, x28, [sp, 80]
    str     x0, [sp, 96]
    str     w1, [sp, 100]
    str     w2, [sp, 104]
    str     x3, [sp, 112]

    ldr     w1, [sp, 100]
    lsl     x0, x1, 3
    bl      malloc
    mov     x19, x0

    ldr     w20, [sp, 100]
    cmp     w20, 0
    ble     .L_init_end
    mov     w21, 0
    ldr     x22, [sp, 96]
.L_init_loop:
    ldr     w0, [x22, x21, lsl 2]
    sxtw    x0, w0
    str     x0, [x19, x21, lsl 3]
    add     w21, w21, 1
    cmp     w21, w20
    blt     .L_init_loop
.L_init_end:

    ldr     w0, [sp, 104]
    ldr     w1, [sp, 104]
    mul     w0, w0, w1
    sxtw    x0, w0
    ldr     x1, [sp, 112]
    str     x0, [x1]

    ldr     w20, [sp, 100]
    cmp     w20, 0
    ble     .L_search_end
    mov     w21, 0
    ldr     x22, [sp, 112]
    ldr     x23, [x22]
.L_search_loop:
    ldr     x0, [x19, x21, lsl 3]
    cmp     x0, x23
    bge     .L_no_update
    mov     x23, x0
    str     x23, [x22]
.L_no_update:
    add     w21, w21, 1
    cmp     w21, w20
    blt     .L_search_loop
.L_search_end:

    mov     x0, x19
    bl      free

    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x27, x28, [sp, 80]
    ldp     x29, x30, [sp], 112
    ret