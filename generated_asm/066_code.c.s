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
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	s0, [sp, #8]
	str	s1, [sp, #4]
	str	s2, [sp]
	ldr	s1, [sp, #8]
	ldr	s2, [sp, #8]
	ldr	s0, [sp, #4]
	ldr	s3, [sp, #4]
	fmul	s0, s0, s3
	fmadd	s1, s1, s2, s0
	ldr	s0, [sp]
	ldr	s2, [sp]
	fnmsub	s0, s0, s1, s2
	fcvt	d0, s0
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fcmp	d0, d1
	cset	w8, gt
	tbnz	w8, #0, LBB0_3
	b	LBB0_1
LBB0_1:
	ldr	s1, [sp, #8]
	ldr	s2, [sp, #8]
	ldr	s0, [sp]
	ldr	s3, [sp]
	fmul	s0, s0, s3
	fmadd	s1, s1, s2, s0
	ldr	s2, [sp, #4]
	ldr	s3, [sp, #4]
	fnmsub	s0, s0, s1, s3
	fcvt	d0, s0
	adrp	x8, lCPI0_0@PAGE
