	.data
value:	 .quad 0b10011011
	
	.text
	.global main
main:

	ldr x0, =value
	ldr x0, [x0]

	mov x1, #0b101110
	orr x2, x0, x1

	mov x1, #0
	orr x3, x0, x1

	mov x1, #0b11111111
	orr x4, x0, x1
	
	mov x0, #0
	ret
