	// Who cleans up the stack, caller or callee? This
	// example is meant to show one convention...

	.data
	// ooh, C-style printf(); statement! It is a "format string"
	// This should be a null terminated string (asciz)
	// %d is a "specifier", signed decimal in this case, of course
	// Because of this you can run this on the command line.
message:	.asciz "The sum is %d \n"
	
	.text
	.global main

addition:	
	stp x29, x30, [sp, #-16]!

	// we will make local variable here even though we don't really
	// need to. first move stack pointer 2x 8 bytes
	// "allocate space on the stack"
	sub sp, sp, #16
	
	// make frame pointer point to the same location
	// fp will be used as "base pointer" to reference local variables
	mov fp, sp

	// save sum of registers to x0. Obviously a loop would
	// be useful here...
	add x0, x0, x1
	add x0, x0, x2
	add x0, x0, x3
	add x0, x0, x4
	add x0, x0, x5
	add x0, x0, x6
	add x0, x0, x7

	// save temporary result to local variable
	str x0, [fp]

	// here is the current state of affairs:
	// 10th parameter	fp + 40
	// 9th parameter	fp + 32
	// x30 value		fp + 24
	// x29 value		fp + 16
	// 16 bytes for local variables <= sp, fp
	// you can move data into two registers in one
	// instruction, of course...so:
	ldp x8, x9, [fp, #32]

	// store sum of x8 and x9 in x8
	add x8, x8, x9

	ldr x0, [fp]

	// calculate total sum now and store it in x0
	add x0, x0, x8

	// deallocate storage
	add sp, sp, #16
	
	ldp x29, x30, [sp], #16

	ret

main:
	stp x29, x30, [sp, #-16]!

	// our calling convention in this space is to pass
	// the first eight parameters as registers and any
	// additional paramenters on stack. We want to sum
	// the first 10 integers...

	// We need to allocate 16 bytes to store 2x 8byte numners
	sub sp, sp, #16
	// restore this below by with add sp, sp, #16
	
	mov x0, #1
	mov x1, #2
	mov x2, #3
	mov x3, #4
	mov x4, #5
	mov x5, #6
	mov x6, #7
	mov x7, #8
	mov x8, #9
	mov x9, #10

	// last parameter is first on stack
	// x30 value		sp + 24
	// x29 value		sp + 16
	// 10th parameter	sp + 8
	// 9th parameter	sp + 0
	// now store two parameters on stack
	stp x8, x9, [sp]
	bl addition
	
	// restore stack after function call
	add sp, sp, #16

	// the return value of the function will be stored in x0.
	// move it to x1.
	mov x1, x0
	// save address of format string in x0
	adr x0, message
	bl printf
	
	ldp x29, x30, [sp], #16

	mov x0, #0
	ret
