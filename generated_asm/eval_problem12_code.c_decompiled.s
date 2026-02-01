func0:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	mov	x19, x0
	mov	x20, x1
	bl	strlen
	mov	w21, w0
	mov	x0, x20
	bl	strlen
	mov	w22, w0
	cmp	w21, w22
	csel	w23, w21, w22, gt
	add	w0, w23, 1
	bl	malloc
	mov	x24, x0
	cbz	x24, .L_return
	mov	w25, 0
	cmp	w23, 0
	ble	.L_terminate
.L_loop:
	ldrb	w0, [x19, x25]
	ldrb	w1, [x20, x25]
	cmp	w0, w1
	cset	w0, eq
	add	w0, w0, 48
	strb	w0, [x24, x25]
	add	w25, w25, 1
	cmp	w23, w25
	bgt	.L_loop
.L_terminate:
	strb	wzr, [x24, x23]
.L_return:
	mov	x0, x24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret