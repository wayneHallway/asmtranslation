.section	.rodata
	.align	3
.LC0:
	.string	"%d"
	.text
	.align	2
	.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [sp, 16]
	adrp	x19, xs.0
	add	x19, x19, :lo12:xs.0
	adrp	x0, __stack_chk_guard
	ldr	x0, [x0, :lo12:__stack_chk_guard]
	adrp	x1, xs.0
	add	x1, x1, :lo12:xs.0
	cmp	x1, x0
	beq	.L2
	bl	__stack_chk_fail
.L2:
	mov	w1, w0
	mov	x0, x19
	adrp	x2, .LC0
	add	x2, x2, :lo12:.LC0
	bl	sprintf
	mov	x0, x19
	bl	strlen
	sub	w2, w0, w1
	cmp	w2, w0
	bge	.L5
	mov	w3, w0
.L4:
	sxtw	x4, w2
	add	x5, x19, x4
	ldrb	w6, [x5, w1, sxtw]
	strb	w6, [x19, x4]
	add	w2, w2, 1
	cmp	w2, w3
	blt	.L4
.L5:
	cbz	w1, .L6
	sxtw	x1, w2
	add	x0, x19, x1
	ldrb	w0, [x0, w1, sxtw]
	strb	w0, [x19, x1]
.L6:
	mov	x0, x19
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	ret
	.size	func0, .-func0
	.local	xs.0
	.comm	xs.0,50,8