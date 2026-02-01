func0:
    stp     x29, x30, [sp, -48]!
    mov     x29, sp
    str     x19, [sp, 16]
    str     x20, [sp, 24]
    str     x21, [sp, 32]
    mov     x19, x0
    bl      strlen
    mov     w20, w0
    sub     w21, w20, #2
    b       .L2
.L5:
    ldr     x1, .L8
    sxtw    x0, w21
    add     x0, x19, x0
    ldrb    w0, [x0]
    bl      strchr
    cmp     x0, 0
    beq     .L3
    sub     w0, w21, #1
    sxtw    x0, w0
    add     x0, x19, x0
    ldrb    w0, [x0]
    mov     x1, x0
    ldr     x0, .L8
    bl      strchr
    cmp     x0, 0
    bne     .L3
    sxtw    x0, w21
    add     x0, x19, x0
    ldrb    w0, [x0]
    b       .L6
.L3:
    sub     w21, w21, #1
.L2:
    cmp     w21, 0
    bgt     .L5
    mov     w0, 0
.L6:
    ldr     x19, [sp, 16]
    ldr     x20, [sp, 24]
    ldr     x21, [sp, 32]
    ldp     x29, x30, [sp], 48
    ret
.L8:
    .xword  .LC0
.LC0:
    .string "AEIOUaeiou"