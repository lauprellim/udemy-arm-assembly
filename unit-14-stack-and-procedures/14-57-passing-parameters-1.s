	// there are two ways to pass parameters: through a register
	// or on the stack.
	
	.text
	.global main

isGreater:
	// store x29 and x30 on stack
	stp x29, x30, [sp, #-16]!
	cmp x0, x1
	// if x0 is greater than x1,
	bgt Greater

	// if x0 is NOT greater than x1, we move 0
	// in to x0.
	mov x0, #0
	// skip over the Greater: label to end:
	b end

Greater:
	// the 1 means that x0 is greater than x1
	mov x0, #1

end:	
	ldp x29, x30, [sp], #16
	ret

main:
	stp x29, x30, [sp, #-16]!
	
	mov x0, #16
	mov x1, #5
	bl isGreater

	// check the result
	// x0 is nonzero? param1 > param2
	// otherwise, param1 < param2
	
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret
