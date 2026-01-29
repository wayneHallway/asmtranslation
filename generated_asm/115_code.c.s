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
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	ldur	w0, [x29, #-4]
	bl	_abs
	mov	w9, #10
	str	w9, [sp, #16]                   ; 4-byte Folded Spill
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	ldur	w0, [x29, #-8]
	bl	_abs
	ldr	w10, [sp, #16]                  ; 4-byte Folded Reload
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	sdiv	w9, w0, w10
	mul	w9, w9, w10
	subs	w9, w0, w9
	mul	w0, w8, w9
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
