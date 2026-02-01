func0:
    // Save registers
    stp     x29, x30, [sp, -48]!
    stp     x19, x20, [sp, 16]
    stp     d8, d9, [sp, 32]
    mov     x29, sp

    // x0 = array, w1 = size
    mov     x19, x0               // x19 = array pointer
    mov     w20, w1               // w20 = size

    // Initialize min and max with array[0]
    ldr     s0, [x19]             // s0 = min = array[0]
    ldr     s1, [x19]             // s1 = max = array[0]
    fmov    s2, s0                // s2 = min (copy)
    fmov    s3, s1                // s3 = max (copy)

    // First loop: find min and max
    cmp     w20, 1
    ble     .Lfirstloopdone
    mov     w9, 1                 // i = 1
.Lfirstloop:
    lsl     x10, x9, 2            // i * 4
    ldr     s4, [x19, x10]        // s4 = array[i]

    // Compare with min
    fcmp    s4, s2
    bge     .Lnotmin
    fmov    s2, s4                // min = array[i]
.Lnotmin:
    // Compare with max
    fcmp    s4, s3
    ble     .Lnotmax
    fmov    s3, s4                // max = array[i]
.Lnotmax:
    add     w9, w9, 1             // i++
    cmp     w9, w20
    blt     .Lfirstloop
.Lfirstloopdone:

    // Compute max - min
    fsub    s5, s3, s2            // s5 = max - min
    fmov    s8, s2                // save min in s8
    fmov    s9, s5                // save (max-min) in s9

    // Second loop: normalize
    mov     w9, 0                 // i = 0
    cmp     w20, 0
    ble     .Ldone
.Lsecondloop:
    lsl     x10, x9, 2            // i * 4
    ldr     s6, [x19, x10]        // s6 = array[i]
    fsub    s6, s6, s8            // array[i] - min
    fdiv    s6, s6, s9            // (array[i]-min)/(max-min)
    str     s6, [x19, x10]        // store back
    add     w9, w9, 1             // i++
    cmp     w9, w20
    blt     .Lsecondloop

.Ldone:
    // Restore registers and return
    ldp     d8, d9, [sp, 32]
    ldp     x19, x20, [sp, 16]
    ldp     x29, x30, [sp], 48
    ret