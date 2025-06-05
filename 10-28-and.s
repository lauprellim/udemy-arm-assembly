	.data
value:	 .quad 0b10011011

	.text
	.global main
main:
	// and reg, src1, operand2
	ldr x0, =value
	ldr x0, [x0]

	mov x1, #0b101110
	and x2, x0, x1

	mov x1, #0
	and x3, x0, x1

	mov x1, #0b11111111
	and x4, x0, x1
	
	mov x0, #0
	ret
