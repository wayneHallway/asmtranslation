.text
	.global func0
func0:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	str	x23, [sp, 48]
	str	x24, [sp, 56]

	mov	w19, w0			// w19 = n
	mov	x20, x1			// x20 = len
	mov	w21, 0			// i = 0
	mov	w22, 256		// j = 256
	str	wzr, [x20]		// *len = 0

	// Allocate array a (simulate malloc, assume size 256 ints)
	mov	x0, 1024
	bl	malloc
	mov	x23, x0			// x23 = a

	cmp	w19, 5
	b.ge	L_else

	// if (n < 5)
	mov	w21, 0			// i = 0
	b	L_for1_test
L_for1_loop:
	ldr	w24, [x20]		// w24 = *len
	add	w24, w24, 1
	str	w24, [x20]		// *len = *len + 1

	// a[i] = n
	lsl	x24, x21, 2		// index i
	str	w19, [x23, x24]

	add	w21, w21, 1
L_for1_test:
	cmp	w21, w19
	b.lt	L_for1_loop
	b	L_return

L_else:
	mov	w21, 2			// i = 2
	b	L_for2_test
L_for2_loop:
	// i * i <= n ?
	mul	w24, w21, w21
	cmp	w24, w19
	b.gt	L_after_for2

	// if (n % i == 0)
	udiv	w24, w19, w21
	msub	w24, w24, w21, w19	// w24 = n % i
	cbnz	w24, L_skip_inner

	// for (j = i; n % j == 0; j++)
	mov	w22, w21		// j = i
	b	L_for3_test
L_for3_loop:
	// a[*len] = i
	ldr	w24, [x20]		// w24 = *len
	lsl	x24, x24, 2
	str	w21, [x23, x24]		// a[*len] = i

	// n = n / j
	udiv	w19, w19, w22

	add	w22, w22, 1
L_for3_test:
	// n % j == 0 ?
	udiv	w24, w19, w22
	msub	w24, w24, w22, w19	// w24 = n % j
	cbz	w24, L_for3_loop

L_skip_inner:
	add	w21, w21, 1
	b	L_for2_test

L_for2_test:
	mul	w24, w21, w21
	cmp	w24, w19
	b.le	L_for2_loop

L_after_for2:
	ldr	w24, [x20]
	add	w24, w24, 1
	str	w24, [x20]		// *len = *len + 1

	// a[*len] = n
	lsl	x24, x24, 2
	str	w19, [x23, x24]

L_return:
	mov	x0, x23			// return a

	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldr	x23, [sp, 48]
	ldr	x24, [sp, 56]
	ldp	x29, x30, [sp], 64
	ret