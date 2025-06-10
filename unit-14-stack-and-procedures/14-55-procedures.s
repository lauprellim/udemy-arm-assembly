	// when we debug this, STEP will enter the procedure, but
	// NEXT will bypass it.

	.text
	.global main

myfunc:
	// this is a very simple procedure!
	mov x0, #1
	ret

main:
	mov x0, #0
	// bl means branch and link
	// like b except it copies value of pc to the link register before
	// branching to the procedure.
	// the link register is x30.
	// this is where we store the address of the NEXT line of code,
	// to which we must return after procedure is done executing.
	bl myfunc
	// we will enter this function twice..
	ldr x0, =myfunc
	
	// branch to register and link
	blr x0
	
	mov x0, #0
	ret
