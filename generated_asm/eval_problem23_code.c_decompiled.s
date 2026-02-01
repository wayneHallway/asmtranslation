.section	.rodata
	.align	3
.LC0:
	.string	""
	.text
	.align	2
	.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	mov	x19, x0			// x19 = str
	mov	x20, x1			// x20 = size
	adrp	x21, .LANCHOR0
	add	x21, x21, :lo12:.LANCHOR0	// x21 = out
	mov	w22, 0			// i = 0
	b	.L2
.L5:
	mov	x23, x19		// p = str
	b	.L3
.L4:
	add	x23, x23, 1		// p++
.L3:
	ldrb	w0, [x23]
	cbz	w0, .L6			// if *p == '\0' break
	cmp	w0, 44
	bne	.L4			// if *p != ',' continue loop
.L6:
	mov	x24, x23		// q = p
	cmp	x23, x24
	beq	.L7			// if p == q continue
	mov	x0, x19			// str
	mov	x1, x24			// &q
	mov	x2, 10			// base 10
	bl	strtol
	sxtw	x0, w0
	str	w0, [x21, w22, sxtw 2]	// out[i] = strtol(...)
.L7:
	add	w22, w22, 1		// i++
	mov	x19, x24		// str = q
.L2:
	ldrb	w0, [x19]
	cbnz	w0, .L5		// while *str != '\0'
	str	w22, [x20]		// *size = i
	mov	x0, x21			// return out
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret
	.size	func0, .-func0
	.local	out.0
	.comm	out.0,4096,4