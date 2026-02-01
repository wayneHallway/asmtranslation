func0:
        sub     sp, sp, #32
        str     w0, [sp, 12]
        str     w1, [sp, 8]
        str     w2, [sp, 4]
        str     w3, [sp]
        ldr     w0, [sp, 4]
        ldr     w1, [sp, 12]
        cmp     w0, w1
        bge     .L2
        ldr     w0, [sp, 4]
        b       .L3
.L2:
        ldr     w0, [sp, 12]
.L3:
        str     w0, [sp, 28]
        ldr     w0, [sp]
        ldr     w1, [sp, 8]
        cmp     w0, w1
        bge     .L4
        ldr     w0, [sp, 8]
        b       .L5
.L4:
        ldr     w0, [sp]
.L5:
        str     w0, [sp, 24]
        ldr     w1, [sp, 24]
        ldr     w0, [sp, 28]
        sub     w0, w1, w0
        str     w0, [sp, 20]
        ldr     w0, [sp, 20]
        cmp     w0, 2
        bgt     .L6
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        b       .L7
.L6:
        mov     w0, 2
        str     w0, [sp, 16]
        b       .L8
.L11:
        ldr     w1, [sp, 16]
        ldr     w0, [sp, 16]
        mul     w0, w1, w0
        ldr     w1, [sp, 20]
        cmp     w0, w1
        bgt     .L9
        ldr     w1, [sp, 20]
        ldr     w0, [sp, 16]
        sdiv    w2, w1, w0
        mul     w0, w2, w0
        sub     w0, w1, w0
        cmp     w0, 0
        bne     .L10
        adrp    x0, .LC1
        add     x0, x0, :lo12:.LC1
        b       .L7
.L10:
        ldr     w0, [sp, 16]
        add     w0, w0, 1
        str     w0, [sp, 16]
.L8:
        ldr     w1, [sp, 16]
        ldr     w0, [sp, 16]
        mul     w0, w1, w0
        ldr     w1, [sp, 20]
        cmp     w0, w1
        ble     .L11
.L9:
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
.L7:
        add     sp, sp, 32
        ret
.LC0:
        .string "NO"
.LC1:
        .string "YES"