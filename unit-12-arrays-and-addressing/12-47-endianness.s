	// demonstrating ARM processor's ability to store data
	// either in big- or little-endian order.

	.data
value:	 .word 0x12345678
	
	.text
	.global main
main:
	ldr x0, =value
	// load unsigned byte
	ldrb w1, [x0], #1
	ldrb w2, [x0], #1
	ldrb w3, [x0], #1
	ldrb w4, [x0]
	
	mov x0, #0
	ret
