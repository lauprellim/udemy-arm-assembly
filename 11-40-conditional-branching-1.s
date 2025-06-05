	.data
size:	 .quad 0

	.text
	.global main
main:
	ldr x0, = size
	ldr x1, [x0]

	// if (size == 0)
	//    (size = 1
	// endif
	// use test or compare instructions so you don't
	// change the value of operands

if:	
	// if x1 is nonzero, zero flag will be cleared (not set)
	// this is going to be true of course, so it will NOT
	// branch to endif:
	tst x1, x1
	bne endif

	mov x1, #1
	// store instruction
	str x1, [x0]

endif:	
	mov x0, #0
	ret
