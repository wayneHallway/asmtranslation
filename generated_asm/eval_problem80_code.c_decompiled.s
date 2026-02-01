.global	func0
	.text

func0:
	stp	x29, x30, [sp, -48]!
	mov	x29, sp
	str	x19, [sp, 16]
	str	x20, [sp, 24]
	str	x21, [sp, 32]
	str	w0, [sp, 44]		// store n

	mov	w0, 64
	bl	malloc
	mov	x19, x0			// s = malloc(64)
	cbz	x19, .Lerror

	strb	wzr, [x19, 63]		// s[63] = '\0'
	ldr	w0, [sp, 44]		// load n
	cbnz	w0, .Lloop_init

	mov	w0, '0'
	strb	w0, [x19, 62]		// s[62] = '0'
	strb	wzr, [x19, 61]		// s[61] = '\0'
	mov	x0, x19
	b	.Ldone

.Lloop_init:
	mov	w20, 62			// i = 62
	ldr	w21, [sp, 44]		// load n
	b	.Lloop_test

.Lloop_body:
	and	w0, w21, 1		// n & 1
	add	w0, w0, '0'		// + '0'
	strb	w0, [x19, x20]		// s[i] = ...
	lsr	w21, w21, 1		// n >>= 1
	sub	w20, w20, 1		// i--

.Lloop_test:
	cmp	w21, 0
	bgt	.Lloop_body

	mov	w0, 6
	bl	malloc
	mov	x21, x0			// q = malloc(6)
	cbz	x21, .Lerror

	adrp	x0, .Ldbstr
	add	x0, x0, :lo12:.Ldbstr
	mov	x1, x21
	bl	strcpy			// strcpy(q, "db")

	mov	x0, x21
	bl	strlen
	add	x20, x21, x0		// p = q + strlen(q)

	add	x0, x19, x20
	ldrb	w0, [x0]		// s[i] (i is in x20 from loop)
	strb	w0, [x20]		// *p = s[i]
	strb	wzr, [x20, 1]		// p[1] = '\0'

	mov	x0, x21			// return q
	b	.Ldone

.Lerror:
	mov	x0, 0

.Ldone:
	ldr	x19, [sp, 16]
	ldr	x20, [sp, 24]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	ret

.Ldbstr:
	.string	"db"