func0:
    // arr in x0, arr_len in w1
    cmp w1, #0
    b.ne .Lcheck_len
    mov w0, #1
    ret
.Lcheck_len:
    cmp w1, #3
    b.ge .Linit
    mov w0, #0
    ret
.Linit:
    mov w2, #1          // i = 1
    ldr w3, [x0]        // prev = arr[0]
    ldr w4, [x0, #4]    // prev_prev = arr[1]
    mov w5, #1          // is_inc = 1
    mov w6, #1          // is_dec = 1
.Lloop:
    cmp w2, w1
    b.ge .Lreturn_ok
    cmp w4, w3
    b.ne .Lcheck_inc
    mov w0, #0
    ret
.Lcheck_inc:
    cmp w5, #2
    b.le .Lupdate_flags
    mov w0, #0
    ret
.Lupdate_flags:
    cmp w4, w3
    b.ge .Lelse
    add w5, w5, #1
    b .Lswap
.Lelse:
    add w6, w6, #1
.Lswap:
    mov w7, w4          // tmp = prev_prev
    mov w4, w3          // prev_prev = prev
    mov w3, w7          // prev = tmp
    add w2, w2, #1      // i++
    b .Lloop
.Lreturn_ok:
    mov w0, #1
    ret