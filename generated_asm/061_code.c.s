.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                        ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #40]
	str	w1, [sp, #36]
	str	x2, [sp, #24]
	fmov	s0, #3.40282347E+38
	str	s0, [sp, #20]
	ldr	x8, [sp, #40]
	ldr	s0, [x8]
	ldr	x8, [sp, #24]
	str	s0, [x8]
	ldr	x8, [sp, #40]
	ldr	s0, [x8, #4]
	ldr	x8, [sp, #24]
	str	s0, [x8, #4]
	str	wzr, [sp, #16]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	ldr	w8, [sp, #16]
	ldr	w9, [sp
