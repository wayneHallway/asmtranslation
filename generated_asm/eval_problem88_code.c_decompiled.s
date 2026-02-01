.global	func0
	.text

func0:
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [sp, 96]           // store ptr
	str	w1, [sp, 100]          // store n
	str	x2, [sp, 104]          // store size
	str	w3, [sp, 108]          // store i
	str	x4, [sp, 112]          // store m (ptr3)

	// ptr1 = malloc(800 * sizeof(int))
	mov	x0, 3200                // 800 * 4
	bl	malloc
	mov	x19, x0                 // x19 = ptr1

	// ptr2 = malloc(8 * sizeof(int))
	mov	x0, 32                  // 8 * 4
	bl	malloc
	mov	x20, x0                 // x20 = ptr2

	ldr	x21, [sp, 112]          // x21 = ptr3 (m)
	ldr	w22, [sp, 108]          // w22 = i
	ldr	w23, [sp, 100]          // w23 = n
	ldr	x24, [sp, 104]          // x24 = size
	ldr	x25, [sp, 96]           // x25 = ptr

	mov	w26, 0                  // j = 0
	b	.L_j_cond

.L_j_loop:
	mov	x27, 0                  // k = 0
	b	.L_k_cond

.L_k_loop:
	// compute ptr + j * size + k
	mul	x28, x26, x24           // j * size
	add	x28, x28, x27           // + k
	ldr	w9, [x25, x28, lsl 2]   // load *(ptr + j*size + k) (int* so lsl 2)
	cmp	w22, w9
	bne	.L_k_next

	// i == *(ptr + j*size + k)
	mov	w28, w27                // l = k
	b	.L_l_cond

.L_l_loop:
	// ptr1[l] = l
	str	w28, [x19, w28, sxtw 2]

	// ptr1[l + 1] = k
	add	w9, w28, 1
	str	w27, [x19, w9, sxtw 2]

	sub	w28, w28, 1             // l--

.L_l_cond:
	cmp	w28, 0
	bgt	.L_l_loop

	// ptr2[0] = j
	str	w26, [x20]

	// *ptr3 = ptr1
	str	x19, [x21]

	// return ptr2
	mov	x0, x20
	b	.L_ret

.L_k_next:
	add	x27, x27, 1             // k++

.L_k_cond:
	cmp	x27, x24
	blt	.L_k_loop

	add	w26, w26, 1             // j++

.L_j_cond:
	cmp	w26, w23
	blt	.L_j_loop

	// loop end: *ptr3 = ptr1
	str	x19, [x21]

	// return ptr2
	mov	x0, x20

.L_ret:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret