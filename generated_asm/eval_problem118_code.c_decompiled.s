.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	add	x29, sp, #48
	stp	x20, x19, [sp, #32]
	stp	x22, x21, [sp, #16]
	stp	x24, x23, [sp, #0]
	mov	x19, x0
	mov	w20, w1
	mov	x21, x2
	mov	x0, x19
	bl	_strlen
	add	w0, w0, #1
	bl	_malloc
	mov	x22, x0
	mov	w23, #0
	mov	x24, #0
	mov	w8, #0
	mov	w9, #0
	mov	w10, #0
	mov	w11, w20
LBB0_1:
	ldrb	w12, [x19, w10, uxtw]
	cbz	w12, LBB0_3
	mov	w9, w12
	mov	w11, w8
	add	w10, w10, #1
	b	LBB0_1
LBB0_3:
	cmp	w9, w8
	b.eq	LBB0_4
	str	w23, [x21]
	mov	x0, x22
	ldp	x24, x23, [sp, #0]
	ldp	x22, x21, [sp, #16]
	ldp	x20, x19, [sp, #32]
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret
LBB0_4:
	sub	w8, w10, w9
	strb	wzr, [x22, w8, uxtw]
	str	w23, [x21]
	mov	x0, x22
	ldp	x24, x23, [sp, #0]
	ldp	x22, x21, [sp, #16]
	ldp	x20, x19, [sp, #32]
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret