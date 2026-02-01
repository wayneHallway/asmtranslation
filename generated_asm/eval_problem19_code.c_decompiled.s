func0:
        stp     x29, x30, [sp, -80]!
        stp     x20, x19, [sp, 32]
        stp     x22, x21, [sp, 48]
        stp     x24, x23, [sp, 64]
        mov     x29, sp
        mov     x19, x0
        mov     x20, x1
        bl      strlen
        mov     w21, w0
        mov     x0, x20
        bl      strlen
        mov     w22, w0
        mov     w23, 0
        mov     w24, 0
        cmp     w21, 0
        ble     .L7
.L6:
        mov     w25, 0
        cmp     w22, 0
        ble     .L3
.L5:
        sub     w2, w22, w24
        add     x0, x19, x24
        add     x1, x20, x25
        bl      strncmp
        cmp     w0, 1
        bne     .L4
        add     w23, w23, 1
.L4:
        add     w25, w25, 1
        cmp     w22, w25
        bgt     .L5
.L3:
        add     w24, w24, 1
        cmp     w21, w24
        bne     .L6
.L7:
        mov     w0, w23
        ldp     x20, x19, [sp, 32]
        ldp     x22, x21, [sp, 48]
        ldp     x24, x23, [sp, 64]
        ldp     x29, x30, [sp], 80
        ret