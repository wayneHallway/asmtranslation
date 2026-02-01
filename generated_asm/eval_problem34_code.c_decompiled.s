.text
	.global	func0
func0:
	stp	x29, x30, [sp, -80]!
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x29, sp

	mov	x19, x0			// x19 = a
	mov	w20, w1			// w20 = n
	mov	x21, x2			// x21 = b

	// c = malloc(n * 3 * 4)
	lsl	w22, w20, 1		// w22 = 2*n
	add	w22, w22, w20		// w22 = 3*n
	lsl	w22, w22, 2		// w22 = 3*n * 4
	mov	w0, w22
	bl	malloc
	mov	x22, x0			// x22 = c

	// First loop: copy a to c
	mov	w23, 0			// i = 0
	b	.Lcopy_check
.Lcopy_loop:
	lsl	x24, x23, 2		// offset = i*4
	ldr	w25, [x19, x24]		// w25 = a[i]
	str	w25, [x22, x24]		// c[i] = a[i]
	add	w23, w23, 1
.Lcopy_check:
	cmp	w23, w20
	blt	.Lcopy_loop

	// Insertion sort outer loop
	mov	w23, 0			// i = 0
	b	.Louter_check
.Louter_loop:
	lsl	x24, x23, 2
	ldr	w25, [x22, x24]		// t = c[i]

	mov	w26, 0			// j = 0
	b	.Linner_check
.Linner_loop:
	lsl	x27, x26, 2
	ldr	w28, [x22, x27]		// c[j]
	cmp	w28, w25		// if c[j] > t
	ble	.Linner_continue

	// Shift loop: k from i down to j+1
	mov	w28, w23		// k = i
	b	.Lshift_check
.Lshift_loop:
	sub	w0, w28, 1		// k-1
	lsl	x1, x0, 2
	ldr	w0, [x22, x1]		// c[k-1]
	lsl	x1, x28, 2
	str	w0, [x22, x1]		// c[k] = c[k-1]
	sub	w28, w28, 1
.Lshift_check:
	cmp	w28, w26
	bgt	.Lshift_loop

	// c[j] = t
	lsl	x27, x26, 2
	str	w25, [x22, x27]
	b	.Linner_end
.Linner_continue:
	add	w26, w26, 1
.Linner_check:
	cmp	w26, w23
	blt	.Linner_loop
.Linner_end:
	add	w23, w23, 1
.Louter_check:
	cmp	w23, w20
	blt	.Louter_loop

	// Copy c to b
	mov	w23, 0			// i = 0
	b	.Lcopyback_check
.Lcopyback_loop:
	lsl	x24, x23, 2
	ldr	w25, [x22, x24]		// c[i]
	str	w25, [x21, x24]		// b[i] = c[i]
	add	w23, w23, 1
.Lcopyback_check:
	cmp	w23, w20
	blt	.Lcopyback_loop

	// free(c)
	mov	x0, x22
	bl	free

	ldp	x25, x26, [sp, 64]
	ldp	x23, x24, [sp, 48]
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret