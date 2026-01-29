.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-12]
	ldur	w8, [x29, #-12]
	add	w0, w8, #1
	lsl	w0, w0, #2
	bl	_malloc
	str	x0, [sp, #8]
	ldr	x9, [sp, #8]
	mov	w8, #1
	str	w8, [x9]
	ldur	w8, [x29, #-12]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	x8, [sp, #8]
	stur	x8, [x29, #-8]
	b	LBB0_10
LBB0_2:
	ldr	x9, [sp, #8]
	mov	w8, #3
	str	w8, [x9, #4]
	mov	w8, #2
	str	w8, [sp, #4]
	b	LBB0_3
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, gt
	tbnz	w8, #0, LBB0_9
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	w8, [sp, #4]
	mov	w9, #2
	sdiv	w8, w8, w9
	mul	w8, w8, w9
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	w8, [sp, #4]
	mov	w9, #2
	sdiv	w8, w8, w9
	add	w8, w8, #1
	ldr	x9, [sp, #8]
	ldrsw	x10, [sp, #4]
	str	w8, [x9, x10, lsl #2]
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	x8, [sp, #8]
	ldr	w9, [sp, #4]
	subs	w9, w9, #1
	ldr	w8, [x8, w9, sxtw #2]
	ldr	x9, [sp, #8]
	ldr	w10, [sp, #4]
	subs	w10, w10, #2
	ldr	w9, [x9, w10, sxtw #2]
	add	w8, w8, w9
	add	w8, w8, #1
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	ldr	w8, [sp, #4]
	add	w8, w
