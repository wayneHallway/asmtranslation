func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     x19, x0
    bl      strlen
    mov     w20, w0
    cmp     w20, 0
    ble     .Lcheck_y
    mov     w21, 0
    mov     w1, 0
    b       .Lloop_test
.Lloop_body:
    ldrb    w2, [x19, w1, sxtw]
    adrp    x0, .Lstr
    add     x0, x0, :lo12:.Lstr
    bl      strchr
    cmp     x0, 0
    cset    w0, ne
    add     w21, w21, w0
    add     w1, w1, 1
.Lloop_test:
    cmp     w1, w20
    blt     .Lloop_body
    b       .Lcheck_y
.Lcheck_y:
    sub     w0, w20, #1
    ldrb    w0, [x19, w0, sxtw]
    orr     w1, w0, 32
    mov     w0, 121
    cmp     w1, w0
    cset    w0, eq
    add     w0, w21, w0
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 24]
    ldr     x21, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret
.Lstr:
    .string "aeiouAEIOU"