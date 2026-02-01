func0:
	stp	x29, x30, [sp, -32]!
	mov	x29, sp
	str	x0, [sp, 16]
	ldr	x0, [sp, 16]
	bl	strlen
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bgt	.L2
	mov	w0, 0
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	bl	is_prime
	and	w0, w0, 255
.L3:
	ldp	x29, x30, [sp], 32
	ret