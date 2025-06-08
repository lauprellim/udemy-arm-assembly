	.data
	// you can also see how this works by
	// defining the variable as hexadecimal
	// i.e., 0x11011011
	// 0b11011011 = 0xdb
value:	 .quad 0b11011011

	.text
	.global main
main:
	ldr x0, =value
	ldr x0, [x0]

	// logical shift left
	// lsl reg, reg, value
	mov x1, #4
	// shift amount is specified in x1
	lsl x2, x0, x1
	// does the same thing
	lsl x2, x0, #4

	lsl x3, x0, #16
	lsl x4, x0, #32
	lsl x4, x0, #48
	
	mov x0, #0
	ret
