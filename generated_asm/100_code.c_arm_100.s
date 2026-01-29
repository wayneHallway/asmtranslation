.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	w0, [sp, #44]
	str	w1, [sp, #40]
	str	w2, [sp, #36]
	str	w3, [sp, #32]
	ldr	w8, [sp, #44]
	ldr	w9, [sp, #36]
	subs	w8, w8, w9
	cset	w8, le
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	w8, [sp, #44]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB0_3
LBB0_2:
	ldr	w8, [sp, #36]
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	b	LBB0_3
LBB0_3:
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	str	w8, [sp, #20]
	ldr	w8, [sp, #40]
	ldr	w9, [sp, #32]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	ldr	w8, [sp, #40]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB0_6
LBB0_5:
	ldr	w8, [sp, #32]
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	b	LBB0_6
LBB0_6:
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	str	w8, [sp, #24]
	ldr	w8, [sp, #24]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	str	w8, [sp, #20]
	ldr	w8, [sp, #20]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB0_8
	b	LBB0_7
LBB0_7:
	adrp	x8, l_.str@PAGE
	add	x8, x8, l_.str@PAGEOFF
	str	x8, [sp, #40]
	b	LBB0_15
LBB0_8:
	mov	w8, #2
	str	w8, [sp, #16]
	b	LBB0_9
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #16]
	mul	w8, w8, w9
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	cset	w8, gt
	tbnz	w8, #0, LBB0_14
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	ldr	w8, [sp, #20]
	ldr	w10, [sp, #16]
	sdiv	w9, w8, w10
	mul	w9, w9, w10
	subs	w8, w8, w9
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_1
