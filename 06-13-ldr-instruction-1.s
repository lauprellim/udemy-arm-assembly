.data
value:	 .quad 0x1234567890abcdef

.text
.global main
main:
	ldr x0, =value
	ldr x1, [x0]
	mov x0, #0
	ret
