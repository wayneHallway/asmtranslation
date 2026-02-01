.section	__TEXT,__cstring,cstring_literals
L_.str:
	.asciz	"0123456789abcdefghijklmnopqrstuv"

	.text
	.globl	_func0
	.p2align	2
_func0:
	stp	x29, x30, [sp, #-48]!
	mov	x29, sp
	stp	x19, x20, [sp, #16]
	stp	x21, x22, [sp, #32]
	mov	w19, w0
	mov	w20, w1

	cmp	w19, w20
	ble	LBB0_2

	mov	w0, #33
	bl	_malloc
	mov	x21, x0
	b	LBB0_3
LBB0_2:
	adrp	x21, L_.str@PAGE
	add	x21, x21, L_.str@PAGEOFF
LBB0_3:
	strb	wzr, [x21]
	mov	w0, #0
	strb	w0, [x21, #32]
	add	x22, x21, #32

	add	w8, w20, w19
	b	LBB0_5
LBB0_4:
	sub	x22, x22, #1
	sub	w9, w8, w10
	add	w9, w9, #48
	strb	w9, [x22]
	asr	w10, w8, #1
	asr	w11, w8, #31
	add	w10, w10, w11
	asr	w11, w8, #1
	and	w11, w11, #254
	sub	w8, w10, w11
LBB0_5:
	cmp	w8, #3
	bgt	LBB0_4

	mov	x0, x22
	ldp	x19, x20, [sp, #16]
	ldp	x21, x22, [sp, #32]
	ldp	x29, x30, [sp], #48
	ret