	.text
	.global main
main:
	mov x0, #20
	// does not set carry flag
	subs x1, x0, #10
	// this will clear the carry flag because the result is negative
	subs x2, x0, #30

	mov x0, #0
	ret
