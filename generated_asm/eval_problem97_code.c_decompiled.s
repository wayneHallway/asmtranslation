.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	add	x29, sp, #48
	stp	x19, x20, [sp, #16]
	stp	x21, x22, [sp, #32]
	mov	x19, x1
	mov	w20, w0
	mov	w0, w20
	lsl	w0, w0, #2
	bl	_malloc
	mov	x21, x0
	str	wzr, [x19]
	mov	w22, #2
	cmp	w22, w20
	b.ge	LBB0_9
LBB0_2:
	ldr	w8, [x19]
	str	w22, [x21, w8, sxtw #2]
	ldr	w8, [x19]
	add	w8, w8, #1
	str	w8, [x19]
	mov	w9, #0
	cmp	w9, w8
	b.ge	LBB0_8
LBB0_4:
	ldr	w10, [x21, w9, sxtw #2]
	mov	w11, w9
LBB0_5:
	cmp	w11, w20
	b.ge	LBB0_7
	sdiv	w12, w22, w10
	msub	w12, w12, w10, w22
	cbnz	w12, LBB0_7
	b	LBB0_9
LBB0_7:
	add	w11, w11, w10
	ldr	w8, [x19]
	cmp	w11, w20
	b.lt	LBB0_5
	add	w9, w9, #1
	cmp	w9, w8
	b.lt	LBB0_4
LBB0_8:
	add	w22, w22, #1
	cmp	w22, w20
	b.lt	LBB0_2
LBB0_9:
	mov	x0, x21
	ldp	x19, x20, [sp, #16]
	ldp	x21, x22, [sp, #32]
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret