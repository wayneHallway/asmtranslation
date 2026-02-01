.text
	.global func0
func0:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	str	x23, [sp, 48]
	mov	x19, x0
	mov	x20, x1
	mov	x21, 0
	mov	w22, 0
	mov	w23, 0
	b	.Lwhile_cond
.Lwhile_body:
	ldrb	w0, [x19, x23]
	cmp	w0, 41
	bne	.Linc_i
	sub	w22, w22, 1
	cmp	w22, 0
	bge	.Linc_i
	mov	x0, x21
	bl	free
	mov	x0, 0
	b	.Lreturn
.Linc_i:
	add	w23, w23, 1
.Lwhile_cond:
	add	x0, x19, x23
	ldrb	w0, [x0]
	cmp	w0, 40
	bne	.Lwhile_body
	mov	w0, w22
	mov	w22, 0
	add	w0, w0, 1
	lsl	x0, x0, 3
	mov	x1, x0
	mov	x0, x21
	bl	realloc
	mov	x21, x0
	sxtw	x0, w23
	str	x0, [x21, x0, lsl 3]
	str	w22, [x20]
	mov	x0, x21
.Lreturn:
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 64
	ret