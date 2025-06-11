	// we are going to compare two integers, and write the greater one
	// to x0.
	// Macros are INSERTED by the assembler, so calling them many times
	// means that your code is going to grow larger and larger. A function
	// could be more efficient...but in a macro there is no calling and
	// returning of the function because the content is already there in
	// the assembled code.
	
	.macro min destination, src1, src2
	cmp \src1, \src2
	// signed comparison
	// we cannot use normal labels here because when this gets assembled
	// there will be two (or more) of these labels as the compiler INSERTS
	// code. Since we called the macro twice in main:, this is a problem.
	// But we can use numbers!
	//
	// f means "the next label 1 in the forward direction"
	// you could also use
	// bgt 1b <== branch to the first label in the backward direction
	bgt 1f

	// if we get here, 2nd int is greater than 1st one
	mov \destination, \src1
	// also branch to label 2 in the FORWARD direction...
	b 2f
	
1:
	// if we get here, the 1st int is greater than the 2nd one
	mov \destination, \src2
2:	
	.endm

	.text
	.global main
main:
	// set up a comparison,
	mov x1, #1
	mov x2, #3
	// call macro
	min x0, x1, x2

	// let's set up another comparison
	// This is going to cause a compilation error unless you use
	// numbers as your labels in the macro.
	mov x1, #10
	mov x2, #-10
	// call macro
	min x0, x1, x2
	
	
	mov x0, #0
	ret
