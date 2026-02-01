.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -64]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	str	x23, [sp, 48]
	str	x24, [sp, 56]

	mov	x19, x0
	mov	x20, x1
	mov	x21, x2
	mov	x22, x3

	add	x23, x22, 0
	mov	w24, 0
	mov	w25, 0
	mov	w26, 0
	mov	w27, 0

Lskip_first_word:
	ldrb	w0, [x23], 1
	cmp	w0, ' '
	bne	Lskip_first_word

Lloop:
	ldrb	w0, [x23], 1
	cbz	w0, Lend_loop
	cmp	w0, ' '
	bne	Lnot_space

	str	w26, [x20], 4
	cmp	w27, w26
	bge	Lskip_update
	mov	w27, w26
Lskip_update:
	str	w0, [x20], 4
	ldrb	w1, [x23, -1]
	str	w1, [x20], 4
	ldrb	w2, [x23, -2]
	str	w2, [x20], 4
	mov	w3, 0
	str	w3, [x20], 4
	b	Lreturn

Lnot_space:
	sxtw	x0, w0
	lsl	x0, x0, 2
	ldr	w26, [x20, x0]
	add	w1, w26, 1
	str	w1, [x20, x0]
	cmp	w26, w25
	ble	Lloop
	mov	w25, w26
	b	Lloop

Lend_loop:
	str	w25, [x21]
	str	w27, [x20], 4
	mov	w0, 0
	str	w0, [x20], 4

Lreturn:
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldr	x23, [sp, 48]
	ldr	x24, [sp, 56]
	ldp	x29, x30, [sp], 64
	ret
	.size	func0, .-func0