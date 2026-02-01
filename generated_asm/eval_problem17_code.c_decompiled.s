.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]
	add	x29, sp, #32
	str	x0, [sp, #16]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	str	x8, [sp, #8]
	mov	w9, #0
	str	w9, [sp, #4]
	sub	x8, sp, #1024
	mov	sp, x8
	mov	x0, x8
	mov	w1, #0
	mov	x2, #1024
	bl	_memset
	ldr	x8, [sp, #16]
Lloop:
	ldrb	w9, [x8]
	cbz	w9, Lloop_end
	add	x8, x8, #1
	str	x8, [sp, #16]
	ldrb	w9, [x8]
	cbz	w9, Lloop_end
	and	w10, w9, #0xff
	mov	x0, w10
	bl	_tolower
	mov	w9, w0
	cmp	w9, #128
	b.ge	Lelse
	sub	x10, x29, #1024
	add	x10, x10, w9, uxtw
	ldrb	w11, [x10]
	cbnz	w11, Lskip
	mov	w11, #1
	strb	w11, [x10]
	ldr	w10, [sp, #4]
	add	w10, w10, #1
	str	w10, [sp, #4]
	b	Lskip
Lelse:
	mov	x0, w9
	mov	x1, #0x100
	bl	_maskrune
	cbz	x0, Lskip
	ldr	w10, [sp, #4]
	add	w10, w10, #1
	str	w10, [sp, #4]
Lskip:
	b	Lloop
Lloop_end:
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldr	x9, [sp, #8]
	cmp	x9, x8
	b.eq	Lno_overflow
	bl	_abort
Lno_overflow:
	ldr	w0, [sp, #4]
	add	sp, x29, #1024
	sub	sp, sp, #32
	ldp	x29, x30, [sp, #32]
	add	sp, sp, #48
	ret