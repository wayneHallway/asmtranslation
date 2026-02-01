.text
	.global	func0
func0:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	str	x23, [sp, 48]
	str	w0, [sp, 60]
	ldr	w0, [sp, 60]
	cmp	w0, 0
	ble	.Lelse
	ldr	w0, [sp, 60]
	str	w0, [sp, 56]
	ldr	w0, [sp, 60]
	neg	w0, w0
	str	w0, [sp, 52]
	mov	w0, 2
	str	w0, [sp, 48]
	mov	w0, 1
	str	w0, [sp, 44]
	mov	w0, 2
	bl	malloc
	str	x0, [sp, 32]
	ldr	x0, [sp, 32]
	cmp	x0, 0
	beq	.Lend
	ldr	x0, [sp, 32]
	mov	w1, '0'
	strb	w1, [x0]
	ldr	w0, [sp, 60]
	cmp	w0, 0
	ble	.Lend
	ldr	x0, [sp, 32]
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	add	x0, x0, 1
	str	x0, [sp, 24]
	ldr	w0, [sp, 60]
	neg	w0, w0
	str	w0, [sp, 60]
	mov	w0, 1
	str	w0, [sp, 44]
	mov	w0, 8
	bl	malloc
	str	x0, [sp, 32]
	ldr	x0, [sp, 32]
	cmp	x0, 0
	beq	.Lend
.Lloop:
	ldr	x0, [sp, 24]
	add	x1, sp, 44
	adrp	x2, .LC0
	add	x2, x2, :lo12:.LC0
	bl	sprintf
	str	w0, [sp, 48]
	ldr	w0, [sp, 48]
	ldr	x1, [sp, 24]
	sxtw	x0, w0
	add	x0, x1, x0
	str	x0, [sp, 24]
	ldr	w0, [sp, 44]
	str	w0, [sp, 56]
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 60]
	str	w0, [sp, 52]
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
	ldr	w0, [sp, 52]
	cmp	w0, 1
	beq	.Lend
	ldr	w0, [sp, 56]
	str	w0, [sp, 52]
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
	ldr	w0, [sp, 52]
	cmp	w0, 1
	bne	.Lloop
	b	.Lend
.Lelse:
	mov	w0, 2
	str	w0, [sp, 56]
	mov	w0, 8
	bl	malloc
	str	x0, [sp, 32]
.Lend:
	ldr	x0, [sp, 32]
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret
.LC0:
	.string	"%d"