.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #32]
	str	w1, [sp, #28]
	str	w2, [sp, #24]
	str	wzr, [sp, #20]
	str	wzr, [sp, #16]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	ldr	w8, [sp, #28]
	mov	w9, #2
	sdiv	w8, w8, w9
	ldr	w9, [sp, #12]                   ; 4-byte Folded Reload
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_6
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #32]
	ldrsw	x9, [sp, #16]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #32]
	ldr	w10, [sp, #28]
	subs	w10, w10, #1
	ldr	w11, [sp, #16]
	subs	w10, w10, w11
	add	x10, x10, w10, sxtw
	ldr	w8, [x9, x10, lsl #2]
	subs	w8, w8, w10
	cset	w8, eq
	tbnz	w8, #0, LBB0_4
	b	LBB0_3
LBB0_3:
	sturb	wzr, [x0, #-1]
	b	LBB0_9
LBB0_4:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	x8, [sp, #32]
	ldrsw	x9, [sp, #16]
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #32]
	ldr	w10, [sp, #28]
	subs	w10, w10, #1
	ldr	w11, [sp, #16]
	subs	w10, w10, w11
	add	x10, x10, w10, sxtw
	ldr	w8, [x9, x10, lsl #2]
	add	w8, w8, w10
	ldr	w9, [sp, #20]
	add	w8, w8, w9
	str	w8, [sp, #20]
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB0_1
LBB0_6:
	ldr	w8, [sp, #28]
	mov	w9, #2
	sdiv	w8, w8, w9
	mul	w8, w8, w9
	subs	w8, w8, #1
	subs	w9, w8, w0
	ldr	w8, [sp, #32
