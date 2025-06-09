	// practice multiply with accumulation
	// use madd, msub, and mneg commands

	// there are also instructions for 32-bit registers:
	// umaddl, smaddl
	// umsubl, smsubl
	// umnegl, smnegl
	
	.text
	.global main
main:
	// x3 = x2 + x0 * x1
	mov x0, #100
	mov x1, #10
	mov x2, #300

	// this does x2 + x0 * x1
	madd x3, x0, x1, x2
	smaddl x3, w0, w1, x2
	
	// x4 = x2 - x0 * x1
	msub x4, x0, x1, x2
	smsubl x4, w0, w1, x2
	
	// x5 = -(x0 * x1)
	mneg x5, x0, x1
	smnegl x5, w0, w1
	
	mov x0, #0
	ret
