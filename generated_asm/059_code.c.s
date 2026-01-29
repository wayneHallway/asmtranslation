.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function func0
lCPI0_0:
	.long	0x42c80000                      ; float 100
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	s0, [sp, #24]
	str	s1, [sp, #20]
	str	s2, [sp, #16]
	ldr	s0, [sp, #24]
	ldr	s1, [sp, #20]
	fadd	s0, s0, s1
	ldr	s1, [sp, #16]
	fcmp	s0, s1
	cset	w8, hs
	tbnz	w8, #0, LBB0_3
	b	LBB0_1
LBB0_1:
	ldr	s0, [sp, #24]
	ldr	s2, [sp, #16]
	fadd	s0, s0, s2
	ldr	s1, [sp, #20]
	fcmp	s0, s1
	cset	w8, hs
	tbnz	w8, #0, LBB0_3
	b	LBB0_2
LBB0_2:
	ldr	s0, [sp, #20]
	ldr	s2, [sp, #16]
	fadd	s0, s0, s2
	ldr	s1, [sp, #24]
	fcmp	s0, s1
	cset	w8, lt
	tbnz	w8, #0, LBB0_4
	b	LBB0_3
LBB0_3:
	adr
