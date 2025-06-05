.data
value:	 .quad 0x1234567890abcdef

.text
.global main
main:
	ldr x0, =value
	// unsigned byte -- use "b" and w register
	ldrb w1, [x0]
	// half word
	ldrh w2, [x0]
	// unsigned word
	ldr w3, [x0]

	// signed data
	ldrsb w4, [x0]
	ldrsh w5, [x0]
	// signed word
	ldrsw x6, [x0]
	
	mov x0, #0
	ret
