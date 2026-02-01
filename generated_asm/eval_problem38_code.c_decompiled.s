func0:
    stp     x29, x30, [sp, -80]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    stp     x25, x26, [sp, 64]
    mov     x29, sp
    mov     x19, x0
    mov     w20, w1
    mov     x21, x2
    sxtw    x22, w1
    lsl     x0, x22, 2
    bl      malloc
    mov     x23, x0
    cmp     w20, 0
    ble     .Lcopy_loop_end
    mov     w24, 0
.Lcopy_loop:
    sxtw    x25, w24
    ldr     s0, [x19, x25, lsl 2]
    str     s0, [x23, x25, lsl 2]
    add     w24, w24, 1
    cmp     w24, w20
    blt     .Lcopy_loop
.Lcopy_loop_end:
    cmp     w20, 0
    ble     .Lpair_loop_end
    mov     w24, 0
.Lpair_loop:
    sxtw    x25, w24
    ldr     s0, [x19, x25, lsl 2]
    str     s0, [x21, x25, lsl 2]
    add     w26, w24, 1
    cmp     w26, w20
    bge     .Lskip_second
    sxtw    x25, w26
    ldr     s0, [x19, x25, lsl 2]
    str     s0, [x21, x25, lsl 2]
.Lskip_second:
    add     w24, w24, 2
    cmp     w24, w20
    blt     .Lpair_loop
.Lpair_loop_end:
    tst     w20, 1
    beq     .Lfree
    sub     w24, w20, 1
    sxtw    x25, w24
    ldr     s0, [x19, x25, lsl 2]
    str     s0, [x21, x25, lsl 2]
.Lfree:
    mov     x0, x23
    bl      free
    ldp     x19, x20, [sp, 16]
    ldp     x21, x22, [sp, 32]
    ldp     x23, x24, [sp, 48]
    ldp     x25, x26, [sp, 64]
    ldp     x29, x30, [sp], 80
    ret