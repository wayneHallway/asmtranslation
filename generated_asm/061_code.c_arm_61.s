.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2                               ; -- Begin function func0
lCPI0_0:
	.long	0x7f7fffff                      ; float 3.40282347E+38
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	w1, [sp, #36]
	str	x2, [sp, #24]
	adrp	x8, lCPI0_0@PAGE
	ldr	q1, [x8, lCPI0_0@PAGEOFF]
	fmov	s0, s0
	str	s0, [sp, #20]
	ldr	x8, [sp, #40]
	ldr	s0, [x8]
	ldr	x8, [sp, #24]
	str	s0, [x8]
	ldr	x8, [sp, #40]
	ldr	s0, [x8, #4]
