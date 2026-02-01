.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -80]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	x22, [sp, 40]
	str	x23, [sp, 48]
	str	x24, [sp, 56]
	mov	x19, x0
	mov	w20, 0
	ldrb	w0, [x19]
	cbz	w0, .Lreturn
	mov	x0, x19
	bl	strlen
	mov	w21, w0
	mov	w22, 0
	mov	w23, 1
	b	.Lfor_cond
.Lfor_loop:
	ldrb	w24, [x19, w22, sxtw]
	adrp	x0, .Lvowels
	add	x0, x0, :lo12:.Lvowels
	mov	w1, w24
	bl	strchr
	cmp	x0, 0
	csinc	w20, w20, w20, eq
	add	w22, w22, 2
	add	w23, w23, 1
.Lfor_cond:
	sxtw	x0, w22
	ldrb	w0, [x19, x0]
	cbnz	w0, .Lfor_loop
.Lreturn:
	mov	w0, w20
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldr	x22, [sp, 40]
	ldr	x23, [sp, 48]
	ldr	x24, [sp, 56]
	ldp	x29, x30, [sp], 80
	ret
.Lvowels:
	.string	"AEIOU"