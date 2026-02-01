func0:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x20, x1
	mov	w21, w2
	mov	x22, x3
	mov	w23, -1000
	mov	w24, 0
	mov	x25, 0
	mov	w0, 0
	b	.L2
.L6:
	add	x1, x20, x0
	mov	x2, x1
	mov	w3, 0
	ldrb	w4, [x2]
	cbz	w4, .L4
.L5:
	add	w3, w3, 1
	sub	w4, w4, 'a'
	add	w4, w4, 'A'
	sub	w4, w4, 'A'
	add	w4, w4, 'a'
	add	x2, x2, 1
	ldrb	w4, [x2]
	cbnz	w4, .L5
.L4:
	cmp	w3, w23
	ble	.L7
	mov	w23, w3
	mov	w24, w0
	mov	x25, x2
.L7:
	add	w0, w0, 1
.L2:
	cmp	w0, w21
	blt	.L6
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x25
	mov	x2, x19
	mov	x3, x22
	bl	sprintf
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
.LC0:
	.string	"%s.%s"