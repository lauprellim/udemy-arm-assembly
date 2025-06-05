	.data
value:	 .quad 0x123456789

	.text
	.global main
main:
	ldr x0, =value
	ldr x0, [x0]

	// logical shift right,
	// lsr reg, reg, value
	mov x1, #4 // this is the shift amount
	lsr x2, x0, x1
	lsr x2, x0, #4
	lsr x3, x0, #16
	lsr x4, x0, #32
	lsr x5, x0, #48
	
	mov x0, #0
	ret
