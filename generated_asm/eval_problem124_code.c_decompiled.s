.global func0
func0:
	sub	sp, sp, #32
	str	x19, [sp, #16]
	str	x30, [sp, #24]
	mov	w19, w0
	str	wzr, [x2]
	str	wzr, [x1]
	cmp	w19, #1
	beq	.Lend
	mov	w0, w19
	mov	w1, #10
.Lloop1:
	asr	w0, w0, #1
	cmp	w0, #1
	bne	.Lloop1
	str	w0, [x2]
.Lloop2:
	ldr	w0, [x2]
	ldr	w1, [x2]
	cmp	w0, w1
	bge	.Lend
	ldr	w0, [x2]
	lsl	w0, w0, #1
	str	w0, [x2]
	ldr	w0, [x2]
	add	w0, w0, #1
	str	w0, [x2]
	ldr	w0, [x2]
	sub	w0, w0, #1
	str	w0, [x2]
	b	.Lloop2
.Lend:
	ldr	x19, [sp, #16]
	ldr	x30, [sp, #24]
	add	sp, sp, #32
	ret