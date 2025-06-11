	// we are going to sum elements in an array!
	// Now we pass parameters through the stack!
	
	.data
array:	.quad 1000, 1001, 1002, 1003
count:	.quad 4
	
	.text
	.global main

arraySum:
	stp x29, x30, [sp, #-16]!

	// now access param1 (array) and param2 (count)
	// if you have more than two parameters stored on
	// stack, you will need more instructions to load
	// them here.
	ldp x2, x1, [sp, #16]

	// we do not need this instruction anymore
	// mov x2, x0
	
	// we store the sume of the array in x0. Initialize it to 0.
	mov x0, #0

sum:	
	// x1 holds the address of the array and each element is
	// 8 bytes (.quad). As always, the [] derefences the pointer
	// thus giving us the value at the memory address.
	ldr x3, [x1], #8

	// add the current element to the existing sum
	add x0, x0, x3
	
	// decrement x2 since we have added one element of the array
	// "s" updates the flags, and if this reaches 0
	subs x2, x2, #1
	// if the zero flag is NOT set, go back to sum:
	bne sum
	
	ldp x29, x30, [sp], #16
	ret

main:
	stp x29, x30, [sp, #-16]!

	// x0 and x1 are 64-bit registers, so we need
	// 16 bytes of storage on the stack (each register
	// takes 8 bytes). So, subtract 16 from the stack
	// pointer register. The stack pointer moves
	// downwards 16 bytes.

	sub sp, sp, #16
	
	adr x0, count
	ldr x0, [x0]
	adr x1, array
	// we push pair (stp) x0 and x1 on the stack
	stp x0, x1, [sp]

	// so the stack will contain:
	//	x30 value	sp + 24
	//	x29 value	sp + 16
	// 	param2 (array)	sp + 8
	//	param1 (count)	sp + 0

	bl arraySum

	// when returning from the procedure, we need
	// to increment the stack pointer
	add sp, sp, #16
	
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret
