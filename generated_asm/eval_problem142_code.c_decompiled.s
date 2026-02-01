func0:
    stp     x29, x30, [sp, -80]!
    mov     x29, sp
    str     x0, [x29, 56]
    ldr     x0, [x29, 56]
    bl      strlen
    str     w0, [x29, 60]
    adrp    x0, .LC0
    add     x0, x0, :lo12:.LC0
    str     x0, [x29, 64]
    ldr     w0, [x29, 60]
    cmp     w0, 5
    ble     .L2
    ldr     x0, [x29, 56]
    ldrb    w0, [x0]
    strb    w0, [x29, 55]
    ldrb    w0, [x29, 55]
    cmp     w0, 64
    bls     .L2
    ldrb    w0, [x29, 55]
    cmp     w0, 90
    bhi     .L2
    adrp    x0, .LC1
    add     x0, x0, :lo12:.LC1
    str     x0, [x29, 64]
.L2:
    str     wzr, [x29, 44]
    str     wzr, [x29, 48]
    str     wzr, [x29, 52]
    b       .L3
.L6:
    ldr     w0, [x29, 52]
    ldr     x1, [x29, 56]
    add     x0, x1, x0
    ldrb    w0, [x0]
    strb    w0, [x29, 54]
    ldrb    w0, [x29, 54]
    cmp     w0, 10
    bne     .L4
    ldr     w0, [x29, 44]
    add     w0, w0, 1
    str     w0, [x29, 44]
.L4:
    ldrb    w0, [x29, 54]
    cmp     w0, 46
    bne     .L5
    ldr     w0, [x29, 48]
    add     w0, w0, 1
    str     w0, [x29, 48]
.L5:
    ldr     w0, [x29, 52]
    add     w0, w0, 1
    str     w0, [x29, 52]
.L3:
    ldr     w1, [x29, 52]
    ldr     w0, [x29, 60]
    cmp     w1, w0
    blt     .L6
    ldr     w0, [x29, 48]
    cmp     w0, 4
    ble     .L7
    adrp    x0, .LC2
    add     x0, x0, :lo12:.LC2
    str     x0, [x29, 64]
.L7:
    ldr     w0, [x29, 44]
    cmp     w0, 1
    ble     .L8
    adrp    x0, .LC0
    add     x0, x0, :lo12:.LC0
    str     x0, [x29, 64]
.L8:
    ldr     x0, [x29, 64]
    ldp     x29, x30, [sp], 80
    ret
.LC0:
    .string ".txt"
.LC1:
    .string ".exe"
.LC2:
    .string ".dll"