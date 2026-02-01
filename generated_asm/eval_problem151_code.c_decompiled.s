func0:
        sub     sp, sp, #32
        str     w0, [sp, 12]
        str     w1, [sp, 8]
        str     w2, [sp, 4]
        str     wzr, [sp, 28]
        ldr     w0, [sp, 12]
        cmp     w0, 2
        ble     .L2
        mov     w0, 1
        str     w0, [sp, 28]
.L2:
        ldr     w0, [sp, 12]
        cmp     w0, 4
        bgt     .L3
        str     wzr, [sp, 28]
.L3:
        mov     w0, 2
        str     w0, [sp, 24]
        b       .L4
.L7:
        ldr     w1, [sp, 24]
        ldr     w0, [sp, 24]
        mul     w0, w1, w0
        ldr     w1, [sp, 12]
        cmp     w0, w1
        bgt     .L11
        ldr     w1, [sp, 12]
        ldr     w0, [sp, 24]
        sdiv    w2, w1, w0
        mul     w0, w2, w0
        sub     w0, w1, w0
        cmp     w0, 0
        bne     .L6
        mov     w0, 1
        str     w0, [sp, 28]
.L6:
        ldr     w0, [sp, 24]
        add     w0, w0, 1
        str     w0, [sp, 24]
.L4:
        ldr     w1, [sp, 24]
        ldr     w0, [sp, 24]
        mul     w0, w1, w0
        ldr     w1, [sp, 12]
        cmp     w0, w1
        ble     .L7
        b       .L8
.L11:
        nop
.L8:
        ldr     w0, [sp, 28]
        cmp     w0, 0
        beq     .L9
        ldr     w0, [sp, 4]
        b       .L10
.L9:
        ldr     w0, [sp, 8]
.L10:
        add     sp, sp, 32
        ret