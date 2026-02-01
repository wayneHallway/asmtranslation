func0:
    // array in x0, array_size in x1
    cbz     x1, .Ltrue
    cmp     x1, #3
    b.hs    .Lskip
    mov     w0, #0
    ret
.Lskip:
    ldr     w2, [x0]            // last_value = array[0]
    ldr     w3, [x0, #4]        // last_value_2 = array[1]
    mov     x4, #2              // i = 2
    mov     x5, #-1             // j = -1
    mov     w6, #1              // is_increasing = true
.Lloop:
    cbz     w6, .Ltrue          // while (is_increasing)
    ldr     w7, [x0, x4, lsl #2] // value = array[i]
    add     x8, x4, #1
    ldr     w8, [x0, x8, lsl #2] // value_2 = array[i+1]
    cmp     w7, w3
    b.lt    .Lfalse             // if (value < last_value_2) return false
    cmp     w7, w2
    b.eq    .Lfalse             // if (value == last_value) return false
    cmp     w8, w2
    b.eq    .Lfalse             // if (value_2 == last_value) return false
    ldr     w9, [x0, x5, lsl #2] // array[j]
    cmp     w9, w2
    b.eq    .Lfalse             // if (array[j] == last_value) return false
    mov     w2, w8              // last_value = value_2
    mov     w3, w7              // last_value_2 = value
    add     x4, x4, #1          // i++
    add     x5, x5, #1          // j++
    b       .Lloop
.Lfalse:
    mov     w0, #0
    ret
.Ltrue:
    mov     w0, #1
    ret