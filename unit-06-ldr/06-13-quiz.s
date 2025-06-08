	.data
value:	 .byte 0b10001000

	.text
	.global main
main:
	ldr x0, =value
	ldrb w1, [x0]
	ret
