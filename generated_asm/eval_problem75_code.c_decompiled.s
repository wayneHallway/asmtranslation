.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	add	x29, sp, #48
	stp	x19, x20, [sp, #16]
	stp	x21, x22, [sp, #32]
	mov	x19, x0
	mov	w20, w1
	mov	x21, x2
	mov	w22, w3
	cbz	w20, LBB0_4
	mov	w8, #0
	mov	w9, #0
LBB0_2:
	ldr	x0, [x19, x8, lsl #3]
	bl	_strlen
	cmp	w0, w9
	csel	w9, w0, w9, gt
	add	w8, w8, #1
	cmp	w8, w20
	b.lo	LBB0_2
	b	LBB0_5
LBB0_4:
	mov	w9, #0
LBB0_5:
	cmp	w9, w21
	csel	x8, x9, x21, lo
	cmp	w22, #0
	ble	LBB0_10
	cbz	w20, LBB0_9
	mov	w10, #0
	mov	w11, #0
LBB0_8:
	ldr	x0, [x19, x10, lsl #3]
	bl	_strlen
	add	w11, w11, w0
	add	w10, w10, #1
	cmp	w10, w20
	b.lo	LBB0_8
	cmp	w11, w8
	b.le	LBB0_9
	mov	x0, x19
	b	LBB0_11
LBB0_9:
	ldr	x0, [x19]
	b	LBB0_11
LBB0_10:
	ldr	x0, [x19]
LBB0_11:
	ldp	x19, x20, [sp, #16]
	ldp	x21, x22, [sp, #32]
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret