.text
	.global	func0
func0:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	mov	x19, x0
	mov	w20, w1
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	cmp	w20, 0
	ble	.Lreturn
	mov	w21, 0
	mov	w22, 0
.Lloop:
	cmp	w22, w20
	bge	.Lreturn
	ldr	x0, [x19, w22, sxtw 3]
	bl	strlen
	mov	w1, w0
	cmp	w1, w21
	ble	.Lnext
	mov	w21, w1
	ldr	x0, [x19, w22, sxtw 3]
.Lnext:
	add	w22, w22, 1
	b	.Lloop
.Lreturn:
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldp	x29, x30, [sp], 48
	ret
.L.str:
	.asciz	""