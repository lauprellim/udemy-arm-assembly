	// this is a basic template for calling a procedure
	// that involves saving the frame pointer and link
	// register on the stack correctly
	
	.text
	.global main

myfunc:
	stp x29, x30, [sp, #-16]!

	ldp x29, x30, [sp], #16

	ret

main:
	stp x29, x30, [sp, #-16]!

	bl myfunc

	ldp x29, x30, [sp], #16

	mov x0, #0
	ret
