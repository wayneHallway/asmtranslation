func0:
    stp     x29, x30, [sp, -64]!
    stp     x19, x20, [sp, 16]
    stp     x21, x22, [sp, 32]
    stp     x23, x24, [sp, 48]
    mov     x29, sp

    mov     w19, w0
    mov     w20, w1
    mov     x21, x2
    mov     x22, x3

    str     wzr, [x22]
    b       .L_start_check

.L_outer_loop:
    mov     w23, 1
    mov     w24, 2
    b       .L_inner_check

.L_inner_loop:
    sdiv    w0, w19, w24
    mul     w1, w0, w24
    subs    w0, w19, w1
    b.ne    .L_not_divisible
    mov     w23, 0
    b       .L_inner_end

.L_not_divisible:
    add     w24, w24, 1

.L_inner_check:
    lsr     w0, w19, 1
    cmp     w24, w0
    ble     .L_inner_loop

.L_inner_end:
    cbz     w23, .L_not_prime
    ldr     w0, [x22]
    sxtw    x0, w0
    str     w19, [x21, x0, lsl 2]
    ldr     w0, [x22]
    add     w0, w0, 1
    str     w0, [x22]

.L_not_prime:
    add     w19, w19, 1

.L_start_check:
    cmp     w19, w20
    ble     .L_outer_loop

    ldp     x23, x24, [sp, 48]
    ldp     x21, x22, [sp, 32]
    ldp     x19, x20, [sp, 16]
    ldp     x29, x30, [sp], 64
    ret