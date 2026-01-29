.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-24]
	ldur	x0, [x29, #-16]
	bl	_strlen
	mov	w8, 0
	str	w8, [sp, #36]
	ldur	x0, [x29, #-24]
	bl	_strlen
	mov	w8, 0
	str	w0, [sp, #32]
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #32]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	w8, [sp, #36]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB0_3
LBB0_2:
	ldr	w8, [sp, #32]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB0_3
LBB0_3:
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	str	w8, [sp, #28]
	ldr	w8, [sp, #28]
	add	w0, w8, #1
	lsl	w0, w0, #0
	bl	_malloc
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
                                        ; kill: def $x8 killed $xzr
	stur	xzr, [x29, #-8]
	b	LBB0_10
LBB0_5:
	str	wzr, [sp, #12]
	b	LBB0_6
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	ldr	w9, [sp, #28]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_9
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_6 Depth=1
	ldur	x8, [x29, #-16]
	ldrsw	x9, [sp, #12]
	ldrsb	w8, [x8, x9]
	ldur	x9, [x29, #-24]
	ldrsw	x10, [sp, #12]
	ldrsb	w9, [x9, x10]
	mov	w10, #49
	mov	w9, #48
	subs	w9, w9, w10
	cset	w9, eq
	and	w9, w9, #0x1
	ands	w9, w9, #0x1
	csel	w8, w8, w9, w10
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #12]
	add	x8, x8, x10
	strb	w8, [x9]
	b	LBB0_8
LBB0_8:                                 ;   in Loop
