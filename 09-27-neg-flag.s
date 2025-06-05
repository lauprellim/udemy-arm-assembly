	.text
	.global main
main:
	mov x0, #30
	// will clear negative flag
	adds x1, x0, #1

	mov x0, #40
	// will set negative flag
	subs x2, x0, #50

	// will clear negative flag
	subs x3, x0, #40
	
	mov x0, #0
	ret
