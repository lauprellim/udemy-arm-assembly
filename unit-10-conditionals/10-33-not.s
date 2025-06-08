	.data
value:	.quad 0b10011011

	.text
	.global main
main:
	ldr x0, =value
	ldr x0, [x0]

	//mvn reg, operand2
	mvn x1, x0

	//movn reg, imm (,lsl)
	movn x2, #0b10011011
	// 0x8000 = 0b10000...
	movn x3, #0x8000, lsl #48
	
	mov x0, #0
	ret
