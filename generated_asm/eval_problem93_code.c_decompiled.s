func0:
        fmov    s3, 0.5
        fmov    s4, #-0.00000011920928955078125
        fadd    s3, s3, s4
        fcmp    s0, s3
        b.ne    .Lfalse
        fcmp    s1, s3
        b.ne    .Lfalse
        fcmp    s2, s3
        b.ne    .Lfalse
        mov     w0, 1
        ret
.Lfalse:
        mov     w0, 0
        ret