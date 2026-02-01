.global	func0
	.text

func0:
	// Prologue
	stp	x29, x30, [sp, -80]!
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x29, sp

	// Save arguments
	mov	x19, x0		// list
	mov	w20, w1		// list_size
	mov	x21, x2		// size

	// *size = 0
	str	wzr, [x21]

	// if (list_size <= 0) return NULL
	cmp	w20, 0
	b.le	.Lreturn_null

	// sorted_list = malloc(sizeof(char *) * list_size)
	mov	w0, 8
	mul	w0, w0, w20
	bl	malloc
	mov	x22, x0		// sorted_list

	// Check malloc failure
	cbz	x22, .Lreturn_null

	// Copy list to sorted_list
	mov	w23, 0		// i = 0
.Lcopy_loop:
	cmp	w23, w20
	b.ge	.Lcopy_done

	// sorted_list[i] = list[i]
	ldr	x0, [x19, w23, sxtw 3]
	str	x0, [x22, w23, sxtw 3]

	add	w23, w23, 1
	b	.Lcopy_loop

.Lcopy_done:
	// Outer loop i = 0
	mov	w23, 0		// i
.Louter_loop:
	cmp	w23, w20
	b.ge	.Louter_done

	// Inner loop j = i
	mov	w24, w23	// j = i
.Linner_loop:
	cmp	w24, w20
	b.ge	.Linner_done

	// Load sorted_list[i] and sorted_list[j]
	ldr	x0, [x22, w23, sxtw 3]	// sorted_list[i]
	ldr	x1, [x22, w24, sxtw 3]	// sorted_list[j]

	// strlen(sorted_list[i])
	bl	strlen
	mov	w25, w0		// len_i

	// strlen(sorted_list[j])
	mov	x0, x1
	bl	strlen
	mov	w26, w0		// len_j

	// Compare lengths
	cmp	w25, w26
	b.le	.Lno_swap

	// Swap sorted_list[i] and sorted_list[j]
	ldr	x0, [x22, w23, sxtw 3]
	ldr	x1, [x22, w24, sxtw 3]
	str	x1, [x22, w23, sxtw 3]
	str	x0, [x22, w24, sxtw 3]

.Lno_swap:
	add	w24, w24, 1
	b	.Linner_loop

.Linner_done:
	add	w23, w23, 1
	b	.Louter_loop

.Louter_done:
	mov	x0, x22		// Return sorted_list
	b	.Lepilogue

.Lreturn_null:
	mov	x0, 0

.Lepilogue:
	// Epilogue
	ldp	x25, x26, [sp, 64]
	ldp	x23, x24, [sp, 48]
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret