.data
_func0: .asciz "0.3"   // example string, replace with actual source

	.text
	.global func0
func0:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	adr	x0, _func0
	bl	atof

	// x < 0
	fmov	d1, xzr
	fcmp	d0, d1
	bge	check_positive

	// x > -0.5
	ldr	d2, =neg_half
	ldr	d2, [x2]
	fcmp	d0, d2
	ble	check_positive
	mov	w0, 1
	b	return

check_positive:
	// x > 0
	fmov	d1, xzr
	fcmp	d0, d1
	ble	return_false

	// x < 0.5
	ldr	d2, =pos_half
	ldr	d2, [x2]
	fcmp	d0, d2
	bge	return_false
	mov	w0, 1
	b	return

return_false:
	mov	w0, 0

return:
	ldp	x29, x30, [sp], 16
	ret

	.section .rodata
neg_half: .double -0.5
pos_half: .double 0.5