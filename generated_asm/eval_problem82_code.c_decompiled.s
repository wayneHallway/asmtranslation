.section	.rodata
	.align	3
.LC0:
	.string	"A+"
.LC1:
	.string	"A"
.LC2:
	.string	"A-"
.LC3:
	.string	"B+"
.LC4:
	.string	"B"
.LC5:
	.string	"B-"
.LC6:
	.string	"C+"
.LC7:
	.string	"C"
.LC8:
	.string	"C-"
.LC9:
	.string	"E"

	.text
	.align	2
	.global	func0
	.type	func0, %function
func0:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x0, [sp, 24]	// marks
	str	w1, [sp, 20]	// n
	ldr	w0, [sp, 20]	// n
	lsl	w0, w0, 3		// n * 8
	bl	_malloc
	str	x0, [sp, 32]	// grade
	str	wzr, [sp, 44]	// i = 0
	b	.L2
.L3:
	ldrsw	x0, [sp, 44]	// i
	lsl	x0, x0, 2		// i*4
	ldr	x1, [sp, 24]	// marks
	add	x0, x1, x0		// &marks[i]
	ldr	s0, [x0]		// marks[i]
	fmov	s1, 90.0
	fcmp	s0, s1
	blt	.L4
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	ldrsw	x0, [sp, 44]	// i
	lsl	x0, x0, 3		// i*8
	ldr	x2, [sp, 32]	// grade
	str	x1, [x2, x0]	// grade[i] = "A+"
	b	.L5
.L4:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 80.0
	fcmp	s0, s1
	blt	.L6
	adrp	x0, .LC1
	add	x1, x0, :lo12:.LC1
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L6:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 70.0
	fcmp	s0, s1
	blt	.L7
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L7:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 60.0
	fcmp	s0, s1
	blt	.L8
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L8:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 50.0
	fcmp	s0, s1
	blt	.L9
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L9:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 40.0
	fcmp	s0, s1
	blt	.L10
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L10:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 33.0
	fcmp	s0, s1
	blt	.L11
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L11:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 30.0
	fcmp	s0, s1
	blt	.L12
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L12:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	ldr	x1, [sp, 24]
	add	x0, x1, x0
	ldr	s0, [x0]
	fmov	s1, 20.0
	fcmp	s0, s1
	blt	.L13
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
	b	.L5
.L13:
	adrp	x0, .LC9
	add	x1, x0, :lo12:.LC9
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x2, [sp, 32]
	str	x1, [x2, x0]
.L5:
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L2:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 20]
	cmp	w1, w0
	blt	.L3
	ldr	x0, [sp, 32]	// grade
	ldr	x0, [x0]		// *grade
	ldp	x29, x30, [sp], 48
	ret
	.size	func0, .-func0