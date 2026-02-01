.text
	.global	func0
func0:
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [sp, 96]		// a
	str	w1, [sp, 104]		// n
	str	x2, [sp, 88]		// reltable
	str	x3, [sp, 80]		// nrel

	// nb = n - 1
	ldr	w1, [sp, 104]
	sub	w19, w1, #1		// w19 = nb

	mov	w20, #0			// i = 0
outer_loop:
	cmp	w20, #2
	b.ge	outer_loop_end

	mov	w21, w19		// nc = nb

	mov	w22, #0			// j = 0
j_loop:
	cmp	w22, w19
	b.ge	j_loop_end

	mov	w23, #0			// k = 0
k_loop:
	cmp	w23, w19
	b.ge	k_loop_end

	// if (nc <= 0) nc = nb
	cmp	w21, #0
	b.gt	skip_nc_reset
	mov	w21, w19
skip_nc_reset:

	// if (nc == j) nc--
	cmp	w21, w22
	b.ne	skip_nc_dec_j
	sub	w21, w21, #1
skip_nc_dec_j:

	// if (nc == k) nc--
	cmp	w21, w23
	b.ne	skip_nc_dec_k
	sub	w21, w21, #1
skip_nc_dec_k:

	// Load a[nc] and a[j]
	ldr	x0, [sp, 96]		// a
	sxtw	x24, w21		// nc index
	lsl	x24, x24, #2
	ldr	w25, [x0, x24]		// a[nc]

	sxtw	x26, w22		// j index
	lsl	x26, x26, #2
	ldr	w27, [x0, x26]		// a[j]

	// if (a[nc] > a[j]) swap
	cmp	w25, w27
	b.le	skip_swap

	// swap a[j] and a[nc]
	str	w25, [x0, x26]		// a[j] = a[nc]
	str	w27, [x0, x24]		// a[nc] = old a[j]

skip_swap:
	add	w23, w23, #1		// k++
	b	k_loop
k_loop_end:
	add	w22, w22, #1		// j++
	b	j_loop
j_loop_end:
	add	w20, w20, #1		// i++
	b	outer_loop
outer_loop_end:

	// *nrel = 0
	ldr	x0, [sp, 80]		// nrel
	str	wzr, [x0]

	mov	w20, #0			// i = 0
outer2_loop:
	ldr	w1, [sp, 104]		// n
	cmp	w20, w1
	b.ge	outer2_loop_end

	mov	w22, #0			// j = 0
inner2_loop:
	ldr	w1, [sp, 104]
	cmp	w22, w1
	b.ge	inner2_loop_end

	// Load a[i] and a[j]
	ldr	x0, [sp, 96]
	sxtw	x24, w20
	lsl	x24, x24, #2
	ldr	w25, [x0, x24]		// a[i]

	sxtw	x26, w22
	lsl	x26, x26, #2
	ldr	w26, [x0, x26]		// a[j]

	// if (a[i] - 1 == a[j])
	sub	w25, w25, #1
	cmp	w25, w26
	b.ne	skip_relation

	// *nrel += 1
	ldr	x0, [sp, 80]
	ldr	w1, [x0]
	add	w1, w1, #1
	str	w1, [x0]

	// malloc(2 * sizeof(int)) -> 8 bytes
	mov	x0, #8
	bl	malloc
	mov	x27, x0			// b

	// b[0] = i, b[1] = j
	str	w20, [x27]
	str	w22, [x27, 4]

	// realloc(*reltable, *nrel * sizeof(char *))
	ldr	x0, [sp, 88]		// reltable
	ldr	x0, [x0]		// *reltable
	ldr	x1, [sp, 80]
	ldr	w1, [x1]		// *nrel
	lsl	x1, x1, #3		// *nrel * 8
	bl	realloc
	ldr	x1, [sp, 88]
	str	x0, [x1]		// *reltable = realloc(...)

	// The following realloc calls are problematic in the original C code
	// but we replicate them literally
	ldr	x0, [sp, 88]
	ldr	x0, [x0]		// *reltable
	sxtw	x1, w20
	lsl	x1, x1, #3
	ldr	x0, [x0, x1]		// (*reltable)[i]
	mov	x1, #16			// 2 * sizeof(char *)
	bl	realloc
	ldr	x1, [sp, 88]
	ldr	x1, [x1]
	sxtw	x2, w20
	lsl	x2, x2, #3
	str	x0, [x1, x2]		// (*reltable)[i] = realloc(...)

	// Second identical realloc
	ldr	x0, [sp, 88]
	ldr	x0, [x0]
	sxtw	x1, w20
	lsl	x1, x1, #3
	ldr	x0, [x0, x1]
	mov	x1, #16
	bl	realloc
	ldr	x1, [sp, 88]
	ldr	x1, [x1]
	sxtw	x2, w20
	lsl	x2, x2, #3
	str	x0, [x1, x2]

	// realloc((*reltable)[i], 2 * sizeof(char))
	ldr	x0, [sp, 88]
	ldr	x0, [x0]
	sxtw	x1, w20
	lsl	x1, x1, #3
	ldr	x0, [x0, x1]
	mov	x1, #2
	bl	realloc
	ldr	x1, [sp, 88]
	ldr	x1, [x1]
	sxtw	x2, w20
	lsl	x2, x2, #3
	str	x0, [x1, x2]

	// (*reltable)[i][0] = (char)b[0]
	ldrb	w1, [x27]		// b[0] as byte
	strb	w1, [x0]

	// (*reltable)[i][1] = (char)b[1]
	ldrb	w1, [x27, 4]		// b[1] as byte
	strb	w1, [x0, 1]

	// free b
	mov	x0, x27
	bl	free

skip_relation:
	add	w22, w22, #1
	b	inner2_loop
inner2_loop_end:
	add	w20, w20, #1
	b	outer2_loop
outer2_loop_end:

	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret