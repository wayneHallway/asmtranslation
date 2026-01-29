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
	stur	w0, [x29, #-12]
	mov	w8, #2
	stur	w8, [x29, #-16]
	mov	w8, #1
	stur	w8, [x29, #-20]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, gt
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w5, [x29, #-20]
	mov	x0, sp
	mov	x1, #0
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	mov	x2, #0
	mov	x3, #-1
	adrp	x4, l_.str@PAGE
	add	x4, x4, l_.str@PAGEOFF
	bl	___snprintf_chk
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	ldur	w9, [x29, #-16]
	add	w8, w8, w9
	stur	w8, [x29, #-16]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-20]
	add	w8, w8, #1
	stur	w8, [x29, #-20]
	b	LBB0_1
LBB0_4:
	ldursw	x0, [x29, #-16]
	bl	_malloc
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB0_11
LBB0_6:
	ldr	x8, [sp, #16]
	str	x8, [sp, #8]
	ldr	x0, [sp, #8]
	mov	w1, #0
	mov	x2, sp
	adrp	x3, l_.str.1@PAGE
	add	x3, x3, l_.str.1@PAGEOFF
	bl	___sprintf_chk
	ldr	x8, [sp, #8]
	add	x8, x8, w0, sxtw
	str	x8, [sp, #8]
	mov	w8, #1
	str	w8
