.global func0
func0:
	stp	x29, x30, [sp, -80]!
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	mov	x29, sp
	mov	x19, x0
	mov	x20, x1

	mov	x0, x19
	bl	strlen
	mov	w21, w0

	mov	x0, x20
	bl	strlen
	mov	w22, w0

	cmp	w21, 0
	ble	.Lend

	mov	w23, w21
	mov	w24, w21
	mov	w25, w21
	mov	w26, w21
	mov	w27, w21
	mov	w28, w21

	cmp	w22, 0
	ble	.Lend

	cmp	w22, 1
	ble	.Lend

	cmp	w21, 1
	ble	.Lend

	cmp	w21, 2
	ble	.Lend

	cmp	w22, 2
	ble	.Lend

	cmp	w21, 3
	ble	.Lend

	cmp	w21, 4
	ble	.Lend

	cmp	w21, 5
	ble	.Lend

	cmp	w21, 6
	ble	.Lend

	cmp	w21, 7
	ble	.Lend

	cmp	w21, 8
	ble	.Lend

	cmp	w21, 9
	ble	.Lend

	cmp	w21, 10
	ble	.Lend

	cmp	w21, 11
	ble	.Lend

	cmp	w21, 12
	ble	.Lend

	cmp	w21, 13
	ble	.Lend

	cmp	w21, 14
	ble	.Lend

	cmp	w21, 15
	ble	.Lend

	cmp	w21, 16
	ble	.Lend

	cmp	w21, 17
	ble	.Lend

	cmp	w21, 18
	ble	.Lend

	cmp	w21, 19
	ble	.Lend

	cmp	w21, 20
	ble	.Lend

	cmp	w21, 21
	ble	.Lend

	cmp	w21, 22
	ble	.Lend

	cmp	w21, 23
	ble	.Lend

	cmp	w21, 24
	ble	.Lend

	cmp	w21, 25
	ble	.Lend

	cmp	w21, 26
	ble	.Lend

	cmp	w21, 27
	ble	.Lend

	cmp	w21, 28
	ble	.Lend

	cmp	w21, 29
	ble	.Lend

	cmp	w21, 30
	ble	.Lend

.Lend:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	ret