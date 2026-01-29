.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	mov	x0, #8
	bl	_malloc
	stur	x0, [x29, #-16]
	ldur	x8, [x29, #-16]
	str	wzr, [x8]
	ldur	x8, [x29, #-16]
	str	wzr, [x8, #4]
	mov	w8, #1
	stur	w8, [x29, #-20]
	b	LBB0_1
LBB0_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-4]
	subs	w8, w8, w9
	cset	w8, gt
	tbnz	w8, #0, LBB0_12
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	str	wzr, [sp, #24]
	ldur	w8, [x29, #-20]
	str	w8, [sp, #20]
	ldur	w8, [x29, #-20]
	str	w8, [sp, #16]
	b	LBB0_3
LBB0_3:                                 ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #16]
	subs	w8, w8, #0
	cset	w8, eq
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=2
	ldr	w8, [sp, #24]
	mov	w10, #10
	mul	w8, w8, w10
	ldr	w9, [sp, #16]
	sdiv	w9, w9, w10
	mul	w9, w9, w10
	subs	w9, w9, w10
	add	w8, w8, w9
	str	w8, [sp, #24]
	ldr	w8, [sp, #16]
	sdiv	w8, w8, w10
	str	w8, [sp, #16]
	b	LBB0_3
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB0_10
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #20]
	mov	w10, #2
	sdiv	w9, w8
