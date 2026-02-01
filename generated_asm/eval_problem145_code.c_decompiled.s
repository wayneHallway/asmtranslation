.section	.text
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	adrp	x8, __stack_chk_guard
	ldr	x8, [x8, :lo12:__stack_chk_guard]
	str	x8, [sp, 72]
	mov	x8, 0
	str	x8, [sp, 64]
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	ldr	x0, [sp, 56]
	bl	atoi
	str	x0, [sp, 40]
	ldr	x0, [sp, 48]
	bl	atoi
	str	x0, [sp, 32]
	ldr	x8, [sp, 40]
	ldr	x9, [sp, 32]
	mul	x8, x8, x9
	str	x8, [sp, 24]
	add	x0, sp, 16
	bl	atoi
	str	x0, [sp, 40]
	add	x0, sp, 0
	bl	atoi
	str	x0, [sp, 32]
	ldr	x8, [sp, 40]
	ldr	x9, [sp, 32]
	mul	x8, x8, x9
	ldr	x9, [sp, 24]
	sdiv	x8, x9, x8
	str	x8, [sp, 24]
	ldr	x8, [sp, 24]
	ldr	x9, [sp, 40]
	sdiv	x10, x8, x9
	msub	x8, x10, x9, x8
	cmp	x8, 0
	cset	w8, eq
	mov	w0, w8
	ldr	x9, [sp, 72]
	adrp	x10, __stack_chk_guard
	ldr	x10, [x10, :lo12:__stack_chk_guard]
	eor	x9, x9, x10
	cmp	x9, 0
	b.eq	.Lfunc0_end
	bl	__stack_chk_fail
.Lfunc0_end:
	ldp	x29, x30, [sp], 80
	ret
	.size	func0, .-func0