.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	w1, [sp, #12]
	ldr	w8, [sp, #12]
	subs	w8, w8, #2
	cset	w8, ge
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	mov	w8, #-1
	str	w8, [sp, #28]
	b	LBB0_15
LBB0_2:
	mov	w8, 2147483647
	str	w8, [sp, #8]                    ; 4-byte Folded Spill
	str	w8, [sp, #4]                    ; 4-byte Folded Spill
	str	wzr, [sp]
	b	LBB0_3
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp]
	ldr	w9, [sp, #12]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_12
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp]
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #8]                    ; 4-byte Folded Reload
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w9, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ; 4-byte Folded Reload
	ldr	w8, [sp, #8]                    ;
