.text
	.global func0
func0:
	stp	x29, x30, [sp, -80]!
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x29, sp

	adrp	x19, .Lstr
	add	x19, x19, :lo12:.Lstr
	str	x19, [sp, 72]           // q = " "

	mov	w20, 0                  // i = 0
	b	.Lfor_i_cond
.Lfor_i:
	ldr	x21, [x0, w20, sxtw 3]  // p = s[i]
	mov	w22, 0                  // j = 0
	b	.Lfor_j_cond
.Lfor_j:
	mov	w23, 0                  // k = 0
	mov	w24, 0                  // l = 0
	b	.Lfor_l_cond
.Lfor_l:
	add	x25, x21, w24, sxtw     // &p[l]
	ldrb	w25, [x25]
	add	x26, x21, w22, sxtw     // &p[j]
	ldrb	w26, [x26]
	cmp	w25, w26
	bne	.Lfor_l_inc
	mov	w23, 1                  // k = 1
	b	.Lfor_l_end
.Lfor_l_inc:
	add	w24, w24, 1
.Lfor_l_cond:
	cmp	w24, w22
	blt	.Lfor_l
.Lfor_l_end:
	cmp	w23, 0
	bgt	.Lfor_j_inc
	ldr	x25, [sp, 72]           // q
	mov	x0, x25
	bl	strlen
	add	x25, x25, x0
	add	x26, x21, w22, sxtw     // &p[j]
	ldrb	w26, [x26]
	strb	w26, [x25]             // q[strlen(q)] = p[j]
	ldr	x25, [sp, 72]
	mov	x0, x25
	bl	strlen
	add	x25, x25, x0
	strb	wzr, [x25]             // q[strlen(q)] = 0
.Lfor_j_inc:
	add	w22, w22, 1
.Lfor_j_cond:
	add	x25, x21, w22, sxtw
	ldrb	w25, [x25]
	cmp	w25, 0
	bne	.Lfor_j
.Lfor_j_end:
	add	w20, w20, 1
.Lfor_i_cond:
	cmp	w20, w1
	blt	.Lfor_i
.Lfor_i_end:
	ldr	x0, [sp, 72]            // return q
	ldp	x25, x26, [sp, 64]
	ldp	x23, x24, [sp, 48]
	ldp	x21, x22, [sp, 32]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 80
	ret
.Lstr:
	.string	" "