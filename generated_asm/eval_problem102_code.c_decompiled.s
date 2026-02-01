func0:
    cmp     w1, w0
    b.ge    L1
    mov     w0, #-1
    ret
L1:
    mov     w2, w1
    mov     w3, #0x40000000
    bic     w3, w2, w3
    cmp     w0, w1
    b.ne    L2
    cmp     w3, #1
    b.ne    L2
    mov     w0, w1
    ret
L2:
    mov     w0, #0
    ret