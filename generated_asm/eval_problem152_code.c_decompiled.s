.global	func0
	.type	func0, %function
func0:
	cbz	x1, .Lret
	mov	x2, 0
	mov	x3, 0
.Louter:
	mov	x4, 0
.Linner:
	madd	x5, x3, x1, x4
	ldr	s0, [x0, x5, lsl 2]
	fcvt	d0, s0
	fcmp	d0, #0.0
	ble	.Lskip
	fcvtzs	x6, d0
	add	x2, x2, x6
.Lskip:
	add	x4, x4, 1
	cmp	x4, x1
	bne	.Linner
	add	x3, x3, 1
	cmp	x3, x1
	bne	.Louter
.Lret:
	mov	x0, x2
	ret
	.size	func0, .-func0