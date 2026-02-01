func0:
        mov     w8, #0
        mov     w9, #0
        cmp     w1, #0
        ble     .L2
.L3:
        ldr     w10, [x0, w9, sxtw #2]
        eor     w10, w10, #1
        add     w8, w8, w10
        add     w9, w9, #1
        cmp     w1, w9
        bgt     .L3
.L2:
        mov     w9, #0
        cmp     w3, #0
        ble     .L4
.L5:
        ldr     w10, [x2, w9, sxtw #2]
        eor     w10, w10, #1
        add     w8, w8, w10
        add     w9, w9, #1
        cmp     w3, w9
        bgt     .L5
.L4:
        cmp     w8, w1
        bge     .L6
        adrp    x0, .LC0
        add     x0, x0, :lo12:.LC0
        ret
.L6:
        adrp    x0, .LC1
        add     x0, x0, :lo12:.LC1
        ret
.LC0:
        .string "YES"
.LC1:
        .string "NO"