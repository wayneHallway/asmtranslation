.global	func0
	.text
	.balign	4

func0:
	sub	sp, sp, #32
	str	x19, [sp, #16]
	str	x20, [sp, #24]
	mov	w19, #-1
	cmp	w1, #3
	b.lt	.Lreturn
	and	w20, w1, #-8
	cbz	w20, .Ltail
	mov	x8, x0
	mov	w9, #0
.Lloop:
	ldr	w10, [x8], #4
	ldr	w11, [x8], #4
	ldr	w12, [x8], #4
	ldr	w13, [x8], #4
	cmp	w10, w19
	csel	w19, w10, w19, gt
	cmp	w11, w19
	csel	w19, w11, w19, gt
	cmp	w12, w19
	csel	w19, w12, w19, gt
	cmp	w13, w19
	csel	w19, w13, w19, gt
	add	w9, w9, #8
	cmp	w9, w20
	b.ne	.Lloop
.Ltail:
	tst	w1, #4
	beq	.Lcheck2
	lsl	w8, w9, #2
	ldr	w10, [x0, w8, sxtw]
	add	w8, w8, #4
	ldr	w11, [x0, w8, sxtw]
	cmp	w10, w19
	csel	w19, w10, w19, gt
	cmp	w11, w19
	csel	w19, w11, w19, gt
	add	w9, w9, #4
.Lcheck2:
	tst	w1, #2
	beq	.Lcheck_special
	lsl	w8, w9, #2
	ldr	w10, [x0, w8, sxtw]
	cmp	w10, w19
	csel	w19, w10, w19, gt
.Lcheck_special:
	mov	w8, #0x7fffffff
	cmp	w19, w8
	csel	w19, wzr, w19, ne
	sub	w19, w19, #1
.Lreturn:
	mov	w0, w19
	ldr	x19, [sp, #16]
	ldr	x20, [sp, #24]
	add	sp, sp, #32
	ret