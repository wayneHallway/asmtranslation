.global	func0
	.text

func0:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	mov	x19, x0

	bl	strlen
	mov	w20, w0

	add	w0, w20, 1
	bl	malloc
	mov	x21, x0

	mov	w1, 0
	cmp	w20, 0
	ble	.Lloop_end

.Lloop:
	sub	w2, w20, w1
	sub	w2, w2, 1
	add	x3, x19, x2
	ldrb	w2, [x3]
	add	x3, x21, x1
	strb	w2, [x3]
	add	w1, w1, 1
	cmp	w1, w20
	blt	.Lloop

.Lloop_end:
	add	x0, x21, x20
	strb	wzr, [x0]

	mov	x0, x21

	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret