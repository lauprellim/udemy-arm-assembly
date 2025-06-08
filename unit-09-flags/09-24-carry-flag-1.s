	.text
	.global main
main:
	mov x0, #10
	// suffix s; carry flag will NOT be set
	adds x1, x0, #1

	// we interpret -1 as the largest unsigned value
	mov x2, #-1
	// carry flag WILL be set
	adds x3, x2, #1
	
	mov x0, #0
	ret
