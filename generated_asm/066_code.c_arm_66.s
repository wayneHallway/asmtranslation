.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function func0
lCPI0_0:
	.quad	0x3f1a36e2eb1c432d              ; double 1.0E-4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	s0, [sp, #40]
	str	s1, [sp, #36]
	str	s2, [sp, #32]
	ldr	s1, [sp, #40]
	ldr	s2, [sp, #40]
	ldr	s3, [sp, #36]
	ldr	s4, [sp, #36]
	fmul	s3, s3, s4
	fmadd	s1, s1, s2, s3
	ldr	s2, [sp, #32]
	ldr	s3, [sp, #32]
	fmov	d1, s1
	fcmp	d1, d2
	fcmp	d1, d3
	fcmp	d1, d4
	cset	w8, ne
	tbnz	w8, #0, LBB0_4
	b	LBB0_1
LBB0_1:
	ldr	s1, [sp, #40]
	ldr	s2, [sp, #40]
	ldr	s3, [sp, #32]
	ldr	s4, [sp, #32]
	fmul	s3, s3, s4
	fmadd	s1, s1, s2, s3
	ldr	s2, [sp, #36]
	ldr	s3, [sp, #36]
	fmov	d1, s1
	fcmp	d1, d2
	fcmp	d1, d3
	fcmp	d1, d4
	cset	w8, ne
	tbnz	w
