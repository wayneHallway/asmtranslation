func0:
    stp     x29, x30, [sp, -112]!
    mov     x29, sp
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    stp     x27, x28, [sp, 80]
    str     x0, [sp, 96]
    mov     w19, w1
    mov     w20, w2
    mov     w21, w3

    lsl     x22, x20, 2
    mov     x0, x22
    bl      malloc
    mov     x23, x0

    mov     x0, x22
    bl      malloc
    mov     x24, x0

    mov     w25, 0
    b       .Linit_check
.Linit_loop:
    sxtw    x26, w25
    lsl     x26, x26, 2
    str     w25, [x23, x26]
    add     w25, w25, 1
.Linit_check:
    cmp     w25, w20
    blt     .Linit_loop

    cmp     w21, 8
    ble     .Lskip_square
    mov     w25, 0
    b       .Lsq_check
.Lsq_loop:
    sxtw    x26, w25
    lsl     x26, x26, 2
    ldr     w27, [x23, x26]
    mul     w27, w27, w27
    str     w27, [x24, x26]
    add     w25, w25, 1
.Lsq_check:
    cmp     w25, w20
    blt     .Lsq_loop
.Lskip_square:

    mov     x0, x22
    bl      malloc
    mov     x28, x0

    mov     w25, 0
    b       .Lcopy1_check
.Lcopy1_loop:
    sxtw    x26, w25
    lsl     x26, x26, 2
    ldr     w27, [x23, x26]
    str     w27, [x28, x26]
    add     w25, w25, 1
.Lcopy1_check:
    cmp     w25, w20
    blt     .Lcopy1_loop

    mov     x0, x22
    bl      malloc
    mov     x19, x0

    mov     w25, 0
    b       .Lcopy2_check
.Lcopy2_loop:
    sxtw    x26, w25
    lsl     x26, x26, 2
    ldr     w27, [x28, x26]
    str     w27, [x19, x26]
    add     w25, w25, 1
.Lcopy2_check:
    cmp     w25, w20
    blt     .Lcopy2_loop

    mov     x0, x22
    bl      malloc
    mov     x20, x0

    mov     w25, 0
    b       .Lcopy3_check
.Lcopy3_loop:
    sxtw    x26, w25
    lsl     x26, x26, 2
    ldr     w27, [x19, x26]
    str     w27, [x20, x26]
    add     w25, w25, 1
.Lcopy3_check:
    cmp     w25, w21
    blt     .Lcopy3_loop

    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x27, x28, [sp, 80]
    ldp     x29, x30, [sp], 112
    ret