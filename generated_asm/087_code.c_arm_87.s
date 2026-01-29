.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function func0
lCPI0_0:
	.quad	0x7fffffffffffffff              ; double NaN
	.quad	0x7fffffffffffffff              ; double NaN
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
	movi	d0, #0000000000000000
	str	s0, [sp, #32]
	str	wzr, [sp, #16]
	str	wzr, [sp, #16]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #36]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #16]
	ldr	s0, [x8, x9, lsl #2]
	ldr	s1, [sp, #32]
	fadd	s0, s0, s1
	str	s0, [sp, #32]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB0_1
LBB0_4:
	ldr	s0, [sp, #32]
	ldr	s1, [sp, #36]
	scvtf	s1, s1
	fdiv	s0, s0, s1
	str	s0, [sp, #28]
	movi	s0, #0000000000000000
	str	s0, [sp, #24]
	str	wzr, [sp, #16]
	b	LBB0_5
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #36]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_8
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	x8, [sp, #40]
	ldrsw	x9, [sp, #16]
	ldr	s0, [x8, x9, lsl #2]
	ldr	s1, [sp, #28]
	fsub	s0, s0, s1
	fcvt	d0, s0
	adrp	x8, lCPI0_0@PAGE
	ldr	q0, [x8, lCPI0_0@PAGEOFF]
	fcmp	d0, d0
	fmov	s0, #0000000000000000
	and	s0, s0, s0
	str	s0, [sp, #24]
	ldr	s0, [sp, #24]
	ldr	s1, [sp, #36]
