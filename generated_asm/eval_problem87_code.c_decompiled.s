.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0
	mov	x20, x19
	mov	w21, 0
	mov	w22, 0
	mov	w23, 0
	mov	x0, x19
	bl	strlen
	add	x0, x0, 2
	bl	malloc
	mov	x24, x0
	mov	x25, x0
	b	.Lcond
.Lloop:
	ldrb	w0, [x20]
	and	w0, w0, 0x80
	cbz	w0, .Lelse
	mov	w0, ' '
	strb	w0, [x24, w21, uxtw]
	add	w21, w21, 1
	b	.Lwhile1_cond
.Lwhile1_loop:
	add	w0, w23, w22
	ldrb	w0, [x20, w0, uxtw]
	strb	w0, [x24, w21, uxtw]
	add	w21, w21, 1
	add	w23, w23, 1
.Lwhile1_cond:
	cmp	w22, 0
	bgt	.Lwhile1_loop
	mov	w22, 0
	b	.Lnext
.Lelse:
	add	w0, w23, w22
	ldrb	w0, [x20, w0, uxtw]
	mov	w1, w0
	b	.Lwhile2_cond
.Lwhile2_loop:
	sub	w0, w21, 1
	ldrb	w0, [x24, w0, uxtw]
	cmp	w0, w1
	ble	.Lwhile2_else
	strb	w1, [x24, w21, uxtw]
	add	w21, w21, 1
	mov	w22, 0
	b	.Lwhile2_end
.Lwhile2_else:
	strb	w0, [x24, w21, uxtw]
	add	w21, w21, 1
	sub	w22, w22, 1
.Lwhile2_cond:
	cmp	w22, 0
	bgt	.Lwhile2_loop
.Lwhile2_end:
	strb	w1, [x24, w21, uxtw]
	add	w21, w21, 1
	add	w22, w22, 1
	add	w23, w23, 1
.Lnext:
	ldrb	w0, [x20]
	cbnz	w0, .Lloop
.Lcond:
	ldrb	w0, [x20]
	cbnz	w0, .Lloop
	strb	wzr, [x24, w21, uxtw]
	adrp	x0, ___stack_chk_guard
	ldr	x0, [x0, #:lo12:___stack_chk_guard]
	cmp	x25, x0
	beq	.Lskip_free
	mov	x0, x25
	bl	free
.Lskip_free:
	mov	x0, x25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	func0, .-func0