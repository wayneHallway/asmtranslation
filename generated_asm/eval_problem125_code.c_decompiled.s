func0:
    stp    x29, x30, [sp, -48]!
    mov    x29, sp
    str    x19, [sp, 16]
    mov    x19, x0

    bl     strlen
    cmp    x0, 10
    b.eq   .Lcheck0
    mov    w0, 0
    b      .Lreturn

.Lcheck0:
    ldrb   w0, [x19]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 1]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 2]
    cmp    w0, '+'
    b.ne   .Lfalse

    ldrb   w0, [x19, 3]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 4]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 5]
    cmp    w0, '+'
    b.ne   .Lfalse

    ldrb   w0, [x19, 6]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 7]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 8]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    ldrb   w0, [x19, 9]
    cmp    w0, '0'
    b.lt   .Lfalse
    cmp    w0, '9'
    b.gt   .Lfalse

    mov    x0, x19
    bl     atoi
    cmp    w0, 0
    b.lt   .Lfalse

    add    x0, x19, 3
    bl     atoi
    cmp    w0, 0
    b.lt   .Lfalse

    add    x0, x19, 6
    bl     atoi
    cmp    w0, 0
    b.lt   .Lfalse

    add    x0, x19, 7
    bl     atoi
    cmp    w0, 0
    b.lt   .Lfalse

    add    x0, x19, 8
    bl     atoi
    cmp    w0, 0
    b.lt   .Lfalse

    add    x0, x19, 9
    bl     atoi
    cmp    w0, 0
    b.lt   .Lfalse

    mov    x0, x19
    bl     atoi
    and    w0, w0, 3
    cmp    w0, 4
    b.eq   .Lfalse

    add    x0, x19, 3
    bl     atoi
    cmp    w0, 31
    b.eq   .Lfalse

    add    x0, x19, 6
    bl     atoi
    cmp    w0, 2
    b.eq   .Lfalse

    add    x0, x19, 7
    bl     atoi
    cmp    w0, 30
    b.gt   .Lfalse

    add    x0, x19, 8
    bl     atoi
    cmp    w0, 31
    b.gt   .Lfalse

    mov    w0, 1
    b      .Lreturn

.Lfalse:
    mov    w0, 0

.Lreturn:
    ldr    x19, [sp, 16]
    ldp    x29, x30, [sp], 48
    ret