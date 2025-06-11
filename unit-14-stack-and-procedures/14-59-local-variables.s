	// this is a basic template for calling a procedure
	// that involves saving the frame pointer and link
	// register on the stack correctly
	
	.text
	.global main

myfunc:
	stp x29, x30, [sp, #-16]!
	// these will be local variables
	mov x0, #100
	mov x1, #200
	// allocate memory on the stack for two 8-byte
	// local variables
	sub sp, sp, #16
	// make frame pointer point to local variables
	mov fp, sp
	// local variable 1 is pointed to by fp
	// local variable 2 is pointed to by fp + 8

	str x0, [fp]
	str x1, [fp, #8]

	// do somehting

	ldr x2, [fp]
	ldr x3, [fp, #8]

	// we need to restore/release stack befoe returning
	add sp, sp, #16
	
	ldp x29, x30, [sp], #16
	ret

main:
	stp x29, x30, [sp, #-16]!

	bl myfunc

	ldp x29, x30, [sp], #16

	mov x0, #0
	ret
