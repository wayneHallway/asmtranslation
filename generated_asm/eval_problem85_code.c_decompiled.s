.text
	.global	func0
func0:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	str	w0, [sp, 60]

	adrp	x0, buf
	add	x0, x0, :lo12:buf
	ldr	w1, [sp, 60]
	adrp	x2, .LC0
	add	x2, x2, :lo12:.LC0
	bl	sprintf

	mov	w0, 33
	bl	malloc
	mov	x19, x0

	adrp	x20, buf
	add	x20, x20, :lo12:buf
	mov	x21, x20
	mov	w22, 0
.L1:
	ldrb	w0, [x21]
	cbz	w0, .L2
	add	w22, w22, 1
	add	x21, x21, 1
	b	.L1
.L2:
	mov	w0, 0
.L3:
	cmp	w22, 1
	ble	.L4
	sub	w1, w22, 1
	add	x1, x20, x1
	ldrb	w2, [x1]
	add	x3, x20, w0, sxtw
	ldrb	w4, [x3]
	strb	w4, [x1]
	strb	w2, [x3]
	add	w0, w0, 1
	sub	w22, w22, 1
	b	.L3
.L4:
	mov	x0, x19
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldp	x29, x30, [sp], 64
	ret

	.section	.rodata
.LC0:
	.string	"%d"

	.comm	buf, 33, 4