func0:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x0, [x29, 40]
	ldr	x0, [x29, 40]
	bl	strlen
	str	w0, [x29, 36]
	str	wzr, [x29, 32]
	str	wzr, [x29, 28]
	b	.L2
.L5:
	ldrsw	x0, [x29, 36]
	ldr	x1, [x29, 40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	bl	is_letter
	cbz	w0, .L3
	ldr	w0, [x29, 36]
	sub	w0, w0, #1
	ldr	x1, [x29, 40]
	sxtw	x0, w0
	add	x0, x1, x0
	ldrb	w0, [x0]
	bl	is_letter
	cbz	w0, .L3
	mov	w0, 1
	str	w0, [x29, 32]
.L3:
	ldr	w0, [x29, 28]
	add	w0, w0, 1
	str	w0, [x29, 28]
.L2:
	ldr	w1, [x29, 28]
	ldr	w0, [x29, 36]
	cmp	w1, w0
	blt	.L5
	ldr	w0, [x29, 32]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret