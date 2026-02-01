.global	func0
	.text

func0:
	// Save callee-saved registers
	stp	x29, x30, [sp, #-96]!
	stp	x19, x20, [sp, #16]
	stp	x21, x22, [sp, #32]
	stp	x23, x24, [sp, #48]
	stp	x25, x26, [sp, #64]
	stp	x27, x28, [sp, #80]
	mov	x29, sp

	// Save arguments
	mov	x19, x0		// a
	mov	w20, w1		// n
	mov	x21, x2		// b
	mov	w22, w3		// m
	mov	x23, x4		// c

	// t = malloc(n * sizeof(int))
	lsl	w24, w20, #2	// n * 4
	mov	w0, w24
	bl	malloc
	mov	x24, x0		// t

	// First loop: i = 0 to n-1
	mov	w25, #0		// i = 0
	cmp	w20, #0
	ble	.Lfirst_loop_end

.Lfirst_loop:
	// t[i] = a[i]
	lsl	w26, w25, #2	// i * 4
	ldr	w27, [x19, x26]	// a[i]
	str	w27, [x24, x26]	// t[i] = a[i]

	// Inner loop: j = 0 to i-1
	mov	w26, #0		// j = 0
	cmp	w25, #0
	ble	.Linner_loop_end

.Linner_loop:
	// if (t[i] < t[j])
	lsl	w27, w25, #2	// i * 4
	ldr	w27, [x24, x27]	// t[i]
	lsl	w28, w26, #2	// j * 4
	ldr	w28, [x24, x28]	// t[j]
	cmp	w27, w28
	bge	.Lno_swap

	// Swap t[i] and t[j]
	str	w28, [x24, x27, lsl #2]	// t[i] = t[j]
	str	w27, [x24, x26, lsl #2]	// t[j] = old t[i]

.Lno_swap:
	add	w26, w26, #1	// j++
	cmp	w26, w25
	blt	.Linner_loop

.Linner_loop_end:
	add	w25, w25, #1	// i++
	cmp	w25, w20
	blt	.Lfirst_loop

.Lfirst_loop_end:
	// Second loop: i = 0 to m-1
	mov	w25, #0		// i = 0
	cmp	w22, #0
	ble	.Lsecond_loop_end

.Lsecond_loop:
	// *c = i
	str	w25, [x23]

	// Inner loop: j = 0 to n-1
	mov	w26, #0		// j = 0
	cmp	w20, #0
	ble	.Lsecond_inner_end

.Lsecond_inner:
	// if (t[j] > b[i])
	lsl	w27, w26, #2	// j * 4
	ldr	w27, [x24, x27]	// t[j]
	lsl	w28, w25, #2	// i * 4
	ldr	w28, [x21, x28]	// b[i]
	cmp	w27, w28
	ble	.Lno_break

	// *c = j
	str	w26, [x23]
	b	.Lbreak_inner

.Lno_break:
	add	w26, w26, #1	// j++
	cmp	w26, w20
	blt	.Lsecond_inner

.Lsecond_inner_end:
.Lbreak_inner:
	add	w25, w25, #1	// i++
	cmp	w25, w22
	blt	.Lsecond_loop

.Lsecond_loop_end:
	// Restore registers and return
	ldp	x27, x28, [sp, #80]
	ldp	x25, x26, [sp, #64]
	ldp	x23, x24, [sp, #48]
	ldp	x21, x22, [sp, #32]
	ldp	x19, x20, [sp, #16]
	ldp	x29, x30, [sp], #96
	ret