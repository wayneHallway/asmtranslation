.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
	.p2align	2
_func0:
	sub	sp, sp, #288
	stp	x29, x30, [sp, #272]
	add	x29, sp, #272
	str	x0, [sp, #248]
	str	x1, [sp, #240]
	adrp	x8, _stack_chk_guard_ptr@GOTPAGE
	ldr	x8, [x8, _stack_chk_guard_ptr@GOTPAGEOFF]
	ldr	s0, [x8]
	str	s0, [sp, #236]
	mov	w8, #0
	str	w8, [sp, #232]
	str	w8, [sp, #228]
	mov	w8, #1073741824
	str	w8, [sp, #224]
	str	w8, [sp, #220]
	ldr	w8, [sp, #248]
	cmp	w8, #5
	b.lt	LBB0_11
	ldr	w8, [sp, #248]
	add	w8, w8, #1
	str	w8, [sp, #248]
	mov	w8, #2
	str	w8, [sp, #216]
	ldr	w8, [sp, #248]
	cmp	w8, #5
	b.ne	LBB0_12
	b	LBB0_13
LBB0_12:
	mov	w8, #4
	str	w8, [sp, #212]
LBB0_13:
	mov	w8, #2
	str	w8, [sp, #208]
	mov	w8, #5
	str	w8, [sp, #204]
	mov	w8, #2
	str	w8, [sp, #200]
	mov	w8, #4
	str	w8, [sp, #196]
	mov	w8, #2
	str	w8, [sp, #192]
	mov	w8, #2
	str	w8, [sp, #188]
	mov	w8, #5
	str	w8, [sp, #184]
	mov	w8, #2
	str	w8, [sp, #180]
	mov	w8, #4
	str	w8, [sp, #176]
	mov	w8, #2
	str	w8, [sp, #172]
	mov	w8, #2
	str	w8, [sp, #168]
	mov	w8, #4
	str	w8, [sp, #164]
	mov	w8, #2
	str	w8, [sp, #160]
	mov	w8, #5
	str	w8, [sp, #156]
	mov	w8, #2
	str	w8, [sp, #152]
	mov	w8, #4
	str	w8, [sp, #148]
	mov	w8, #2
	str	w8, [sp, #144]
	mov	w8, #2
	str	w8, [sp, #140]
	mov	w8, #4
	str	w8, [sp, #136]
	mov	w8, #2
	str	w8, [sp, #132]
	mov	w8, #5
	str	w8, [sp, #128]
	mov	w8, #2
	str	w8, [sp, #124]
	mov	w8, #4
	str	w8, [sp, #120]
	mov	w8, #2
	str	w8, [sp, #116]
	mov	w8, #2
	str	w8, [sp, #112]
	mov	w8, #4
	str	w8, [sp, #108]
	mov	w8, #2
	str	w8, [sp, #104]
	mov	w8, #5
	str	w8, [sp, #100]
	mov	w8, #2
	str	w8, [sp, #96]
	mov	w8, #4
	str	w8, [sp, #92]
	mov	w8, #2
	str	w8, [sp, #88]
	mov	w8, #2
	str	w8, [sp, #84]
	mov	w8, #5
	str	w8, [sp, #80]
	mov	w8, #2
	str	w8, [sp, #76]
	mov	w8, #4
	str	w8, [sp, #72]
	mov	w8, #2
	str	w8, [sp, #68]
	mov	w8, #2
	str	w8, [sp, #64]
LBB0_11:
	ldp	x29, x30, [sp, #272]
	add	sp, sp, #288
	ret