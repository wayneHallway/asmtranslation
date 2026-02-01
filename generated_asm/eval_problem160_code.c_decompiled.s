func0:
	sub	w8, w2, w1
	cmp	w8, w0
	blt	.Lelse
	add	w8, w2, w0
	str	w8, [x3]
	mov	w0, #0
	ret
.Lelse:
	add	w8, w1, w0
	str	w8, [x3]
	sub	w8, w2, w1
	str	w8, [x3]
	mov	w0, w2
	ret