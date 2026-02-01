.text
	.global func0
func0:
	stp	x29, x30, [sp, -256]!
	mov	x29, sp
	str	x0, [sp, 240]    // store planet
	str	x1, [sp, 248]    // store name
	str	x2, [sp, 256]    // store index

	// Allocate space for local int variables i..z (20 ints = 80 bytes)
	sub	sp, sp, #80
	// Allocate space for local int* variables a..z (20 pointers = 160 bytes)
	sub	sp, sp, #160
	// Allocate space for local char* variables a1..z1 (26 pointers = 208 bytes)
	sub	sp, sp, #208

	// Set up int* variables (addresses of local ints)
	// x is at [sp, 76] (since i=0, j=4, ..., x=76)
	add	x3, sp, #76
	str	x3, [sp, 80]    // a = &x (a is first int* at offset 80)

	add	x3, sp, #80
	str	x3, [sp, 84]    // b = &y

	add	x3, sp, #84
	str	x3, [sp, 88]    // c = &z

	add	x3, sp, #72
	str	x3, [sp, 92]    // d = &w

	add	x3, sp, #68
	str	x3, [sp, 96]    // e = &v

	add	x3, sp, #64
	str	x3, [sp, 100]   // f = &u

	add	x3, sp, #60
	str	x3, [sp, 104]   // g = &t

	add	x3, sp, #56
	str	x3, [sp, 108]   // h = &s

	add	x3, sp, #52
	str	x3, [sp, 112]   // i = &r

	add	x3, sp, #48
	str	x3, [sp, 116]   // j = &q

	add	x3, sp, #44
	str	x3, [sp, 120]   // k = &p

	add	x3, sp, #40
	str	x3, [sp, 124]   // l = &o

	add	x3, sp, #36
	str	x3, [sp, 128]   // m = &n

	add	x3, sp, #32
	str	x3, [sp, 132]   // n = &m

	add	x3, sp, #28
	str	x3, [sp, 136]   // o = &l

	add	x3, sp, #24
	str	x3, [sp, 140]   // p = &k

	add	x3, sp, #20
	str	x3, [sp, 144]   // q = &j

	add	x3, sp, #16
	str	x3, [sp, 148]   // r = &i

	add	x3, sp, #12
	str	x3, [sp, 152]   // s = &h

	add	x3, sp, #8
	str	x3, [sp, 156]   // t = &g

	add	x3, sp, #4
	str	x3, [sp, 160]   // u = &f

	add	x3, sp, #0
	str	x3, [sp, 164]   // v = &e

	add	x3, sp, #92
	str	x3, [sp, 168]   // w = &d

	add	x3, sp, #88
	str	x3, [sp, 172]   // x = &c

	add	x3, sp, #84
	str	x3, [sp, 176]   // y = &b

	add	x3, sp, #80
	str	x3, [sp, 180]   // z = &a

	// Set up char* variables (string literals)
	adrp	x3, .Lstr0
	add	x3, x3, :lo12:.Lstr0
	str	x3, [sp, 184]   // a1 = "Mercury"

	adrp	x3, .Lstr1
	add	x3, x3, :lo12:.Lstr1
	str	x3, [sp, 192]   // b1 = "Venus"

	adrp	x3, .Lstr2
	add	x3, x3, :lo12:.Lstr2
	str	x3, [sp, 200]   // c1 = "Earth"

	adrp	x3, .Lstr3
	add	x3, x3, :lo12:.Lstr3
	str	x3, [sp, 208]   // d1 = "Mars"

	adrp	x3, .Lstr4
	add	x3, x3, :lo12:.Lstr4
	str	x3, [sp, 216]   // e1 = "Jupiter"

	adrp	x3, .Lstr5
	add	x3, x3, :lo12:.Lstr5
	str	x3, [sp, 224]   // f1 = "Saturn"

	adrp	x3, .Lstr6
	add	x3, x3, :lo12:.Lstr6
	str	x3, [sp, 232]   // g1 = "Uranus"

	adrp	x3, .Lstr7
	add	x3, x3, :lo12:.Lstr7
	str	x3, [sp, 240]   // h1 = "Neptune"

	// Restore stack and return
	add	sp, sp, #448
	ldp	x29, x30, [sp], 256
	ret

	.section .rodata
.Lstr0:
	.string	"Mercury"
.Lstr1:
	.string	"Venus"
.Lstr2:
	.string	"Earth"
.Lstr3:
	.string	"Mars"
.Lstr4:
	.string	"Jupiter"
.Lstr5:
	.string	"Saturn"
.Lstr6:
	.string	"Uranus"
.Lstr7:
	.string	"Neptune"