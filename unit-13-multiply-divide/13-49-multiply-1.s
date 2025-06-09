	// practice multiplying
	// there is no muls instruction, so we can't detect overflow!
	// but we can use umulh and smulh instructions.

	// there are also umull and smull instructions that will
	// multiply signed and unsigned 32-bit registers together,
	// storing the product in a 64-bit register.
	
	.text
	.global main
main:
	mov x0, #100
	mov x1, #10
	mul x2, x0, x1

	// this will cause leftmost 1 to be shifted outside
	// the 64-bit register. Overflow will occur!
	mov x3, #0x1000000000000000
	mov x4, #16
	mul x5, x3, x4

	// value 1 should be in x6.
	umulh x6, x3, x4
	// you can also try smulh.
	
	mov x0, #0
	ret
