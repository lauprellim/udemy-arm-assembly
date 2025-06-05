	.text
	.global main
main:
	mov x0, #2000
	// x1 can store this, overflow flag will not be set
	adds x1, x0, #1000

	mov x0, #-1
	// overflow flag will be cleared
	subs x2, x0, #1

	mov x3, #1
	// shift left by 63 bits -- this is the minimum value
	lsl x4, x3, #63
	// this should set overflow flag
	subs x5, x4, #1

	// suffix s sets the flags
	// should also set overflow flag
	negs x6, x4
	
	mov x0, #0
	ret
