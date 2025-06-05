	.data
value:	 .quad 0b10011011

	.text
	.global main
main:
	ldr x0, =value
	ldr x0, [x0]

	// eor reg, source1, operand2
	mov x1, #0b101110
	eor x2, x0, x1

	eor x3, x0, x0

	mov x4, #0
	eor x5, x0, x4

	mov x6, #0b11111111
	eor x7, x0, x6
	
	mov x0, #0
	ret
