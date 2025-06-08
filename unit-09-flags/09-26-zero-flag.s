	.text
	.global main
main:
	mov x0, #5
	// sets zero flag
	subs x1, x0, #5

	mov x2, #1
	// will clear zero flag
	adds x3, x2, #10
	
	mov x0, #0
	ret
