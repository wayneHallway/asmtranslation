.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]
	add	x29, sp, #48
	stp	x0, x1, [sp, #32]
	stp	x2, x3, [sp, #16]
	ldr	x0, [sp, #32]
	bl	_strlen
	str	w0, [sp, #12]
	ldr	w8, [sp, #12]
	add	w0, w8, #1
	bl	_malloc
	str	x0, [sp]
	str	wzr, [sp, #8]
	b	LBB0_4
LBB0_2:
	ldr	x8, [sp, #32]
	ldrsw	x9, [sp, #8]
	ldrb	w8, [x8, x9]
	ldr	x10, [sp, #40]
	ldrb	w10, [x10, x9]
	cmp	w8, w10
	b.ne	LBB0_5
	ldr	x10, [sp]
	strb	w8, [x10, x9]
	b	LBB0_6
LBB0_5:
	adrp	x8, l_.str@PAGE
	add	x8, x8, l_.str@PAGEOFF
	str	x8, [sp]
	b	LBB0_7
LBB0_6:
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
LBB0_4:
	ldr	x8, [sp, #32]
	ldrsw	x9, [sp, #8]
	ldrb	w8, [x8, x9]
	cbnz	w8, LBB0_2
LBB0_7:
	ldr	x8, [sp]
	ldrsw	x9, [sp, #8]
	strb	wzr, [x8, x9]
	ldr	x0, [sp, #24]
	ldr	x1, [sp]
	bl	_strcpy
	ldr	x0, [sp, #16]
	ldr	x1, [sp]
	bl	_strcpy
	ldr	x0, [sp]
	bl	_free
	ldp	x29, x30, [sp, #48]
	add	sp, sp, #64
	ret

	.section	__TEXT,__cstring,cstring_literals
l_.str:
	.asciz	"False"