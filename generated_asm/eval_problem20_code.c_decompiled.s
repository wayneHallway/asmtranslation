.section	.rodata
l___const.func0.numto:
	.word	0

	.text
	.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	str	x0, [sp, 104]
	adrp	x8, l___const.func0.numto
	add	x8, x8, :lo12:l___const.func0.numto
	str	x8, [sp, 96]
	ldr	x8, [sp, 96]
	ldr	w8, [x8]
	ldr	x9, [sp, 104]
	cmp	w8, w9
	beq	.L2
	bl	__stack_chk_fail
.L2:
	str	wzr, [sp, 92]
	b	.L3
.L8:
	str	wzr, [sp, 88]
	b	.L4
.L7:
	ldr	x8, [sp, 96]
	ldrsw	x9, [sp, 88]
	ldr	w9, [x8, x9, lsl 2]
	ldrsw	x10, [sp, 92]
	ldr	x8, [sp, 104]
	ldrb	w8, [x8, x10]
	cmp	w9, w8
	bne	.L5
	ldr	w8, [sp, 88]
	str	w8, [sp, 84]
	b	.L6
.L5:
	ldr	w8, [sp, 88]
	add	w8, w8, 1
	str	w8, [sp, 88]
.L4:
	ldr	w8, [sp, 88]
	cmp	w8, 9
	ble	.L7
	ldr	w8, [sp, 92]
	add	w8, w8, 1
	str	w8, [sp, 92]
.L3:
	ldrsw	x8, [sp, 92]
	ldr	x9, [sp, 104]
	ldrb	w8, [x9, x8]
	cmp	w8, 0
	bne	.L8
.L6:
	str	wzr, [sp, 92]
	b	.L9
.L12:
	ldr	w8, [sp, 84]
	ldr	w9, [sp, 92]
	cmp	w8, w9
	bne	.L10
	ldrsw	x8, [sp, 92]
	add	x9, sp, 16
	mov	w10, 32
	strb	w10, [x9, x8]
	b	.L11
.L10:
	ldrsw	x8, [sp, 92]
	ldr	x9, [sp, 104]
	ldrb	w9, [x9, x8]
	add	x10, sp, 16
	strb	w9, [x10, x8]
.L11:
	ldr	w8, [sp, 92]
	add	w8, w8, 1
	str	w8, [sp, 92]
.L9:
	ldr	w8, [sp, 92]
	cmp	w8, 9
	ble	.L12
	ldrsw	x8, [sp, 92]
	add	x9, sp, 16
	strb	wzr, [x9, x8]
	add	x0, sp, 16
	ldp	x29, x30, [sp], 112
	ret
	.size	func0, .-func0