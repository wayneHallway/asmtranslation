.global	func0
	.text

func0:
	stp	x29, x30, [sp, -112]!
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x0, [sp, 96]          // store str
	str	x1, [sp, 104]         // store size pointer

	// char **res = (char **)malloc(sizeof(char *));
	mov	x0, 8
	bl	malloc
	mov	x19, x0               // x19 = res

	// char *tmp = (char *)malloc(sizeof(char) * (strlen(str) >> 29));
	ldr	x0, [sp, 96]
	bl	strlen
	lsr	x0, x0, 29
	bl	malloc
	mov	x20, x0               // x20 = tmp

	// tmp[0] = '\0';
	strb	wzr, [x20]

	// for (int i = 0; i < strlen(str); i++)
	ldr	x0, [sp, 96]
	bl	strlen
	mov	x21, x0               // x21 = strlen(str)
	mov	w22, 0                // w22 = i = 0
	b	.Lfor_cond

.Lfor_loop:
	// res[i] = (char *)malloc(sizeof(char) * (strlen(tmp) + 1));
	mov	x0, x20
	bl	strlen
	add	x0, x0, 1
	bl	malloc
	// x19 = res, w22 = i, store malloc result into res[i]
	sxtw	x1, w22
	lsl	x1, x1, 3
	str	x0, [x19, x1]         // res[i] = malloc result
	mov	x23, x0               // x23 = res[i]

	// res[i][strlen(tmp)] = str[i];
	mov	x0, x20
	bl	strlen
	mov	x24, x0               // x24 = strlen(tmp)
	ldr	x25, [sp, 96]         // x25 = str
	sxtw	x26, w22
	ldrb	w27, [x25, x26]      // w27 = str[i]
	add	x28, x23, x24
	strb	w27, [x28]           // res[i][strlen(tmp)] = str[i]

	// res[i][strlen(tmp) + 1] = '\0';
	add	x28, x28, 1
	strb	wzr, [x28]

	// strcat(res[i], tmp);
	mov	x0, x23
	mov	x1, x20
	bl	strcat

	add	w22, w22, 1

.Lfor_cond:
	cmp	w22, w21
	blt	.Lfor_loop

	// free(tmp);
	mov	x0, x20
	bl	free

	// *size = strlen(str);
	ldr	x0, [sp, 96]
	bl	strlen
	ldr	x1, [sp, 104]
	str	w0, [x1]

	// return res;
	mov	x0, x19

	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	ret