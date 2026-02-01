.text
	.global func0
func0:
	stp	x29, x30, [sp, -80]!
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x29, sp

	mov	w19, w1			// w19 = n
	mov	x20, x0			// x20 = a
	mov	x21, x2			// x21 = b
	mov	x22, x3			// x22 = c

	mov	w23, 0			// i = 0
	b	.L_i_loop_test

.L_i_loop:
	ldr	w24, [x20, w23, sxtw 2]	// t = a[i]

	mov	w25, 0			// j = 0
	b	.L_j_loop_test

.L_j_loop:
	ldr	w26, [x20, w25, sxtw 2]	// a[j]
	cmp	w24, w26			// if (t > a[j])
	ble	.L_j_next

	mov	w27, 0			// k = 0
	b	.L_k_loop_test

.L_k_loop:
	ldr	w0, [x21, w27, sxtw 2]	// b[k]
	str	w0, [x22, w27, sxtw 2]	// c[k] = b[k]
	str	w26, [x21, w27, sxtw 2]	// b[k] = a[j]

	add	w27, w27, 1		// k++

.L_k_loop_test:
	cmp	w27, w19			// k < n
	blt	.L_k_loop

.L_j_next:
	add	w25, w25, 1		// j++

.L_j_loop_test:
	cmp	w25, w19			// j < n
	blt	.L_j_loop

	add	w23, w23, 1		// i++

.L_i_loop_test:
	cmp	w23, w19			// i < n
	blt	.L_i_loop

	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret