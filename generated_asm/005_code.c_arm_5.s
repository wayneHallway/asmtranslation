arm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function func0
lCPI0_0:
	.long	0x80000000                      ; float -0
	.long	0x80000000                      ; float -0
	.long	0x80000000                      ; float -0
	.long	0x80000000                      ; float -0
lCPI0_1:
	.long	0x3effffff                      ; float 0.49999997
	.long	0x3effffff                      ; float 0.49999997
	.long	0x3effffff                      ; float 0.49999997
	.long	0x3effffff                      ; float 0.49999997
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
	ldr	s0, [sp, #8]
	fmov	s1, s0
	adrp	x8, lC
