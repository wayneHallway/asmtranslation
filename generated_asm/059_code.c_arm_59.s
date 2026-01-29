.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
lCPI0_1:
	.long	0x80000000                      ; -- begin
	.long	0x80000000                      ; -- end
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
	ldr	s1, [sp, #24]
	ldr	s0, [sp, #20]
	fadd	s1, s1, s0
	ldr	s0, [sp, #16]
	fcmp	s0, s1
	cset	w8, hs
	tbnz	w8, #0, LBB0_3
	b	LBB0_1
LBB0_1:
	ldr	s1, [sp, #24]
	ldr	s0, [sp, #16]
	fadd	s1, s1, s0
	ldr	s0, [sp, #20]
	fcmp	s0, s1
	cset	w8, hs
	tbnz	w8, #0, LBB0_3
	b	LBB0_2
LBB0_2:
	ldr	s1, [sp, #20]
	ldr	s0, [sp, #16]
	fadd	s1, s1, s0
	ldr	s0, [sp, #24]
	fcmp	s0, s1
	cset	w8, lt
	tbnz	w8, #0, LBB0_4
	b	LBB0_
