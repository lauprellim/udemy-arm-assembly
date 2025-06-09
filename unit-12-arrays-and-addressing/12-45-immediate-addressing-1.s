	.data
	// this is an eight-element array.
	// offset is 2 bytes.
items:	 .byte 10,20,30,40,50,60,70,80
	.text
	.global main
main:
	adr x0, items
	// LoaD Register Byte instruction --
	// this will load 30 into register 1.
	ldrb w1, [x0, #2]
	mov x0, #0
	ret
