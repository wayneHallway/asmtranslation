.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                        ; -- Begin function func0
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
	fneg	s0, s0
	ldr	s1, [sp, #4]
	fneg	s1, s1
	ldr	s2, [sp]
	fneg	s2, s2
	ldr	s3, [sp, #4]
	fneg	s3, s3
	fadd	s0, s0, s1, lsl #11
	fcmp	s0, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_1
	b	LBB0_1
LBB0_1:
	str	wzr, [sp, #12]
	b	LBB0_11
LBB0_2:
	ldr	s0, [sp, #4]
	fneg	s0, s0
	ldr	s1, [sp, #4]
	fneg	s1, s1
	ldr	s2, [sp]
	fneg	s2, s2
	ldr	s3, [sp, #4]
	fneg	s3, s3
	fadd	s0, s0, s1, lsl #11
	fcmp	s0, #0
	cset	w8,
