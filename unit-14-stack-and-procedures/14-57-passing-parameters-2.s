	// we are going to sum elements in an array!
	// in this method we pass parameters through registers,
	// as before. In -3, we will pass parameters on the
	// stack.
	
	.data
array:	.quad 1000, 1001, 1002, 1003
count:	.quad 4
	
	.text
	.global main

arraySum:
	stp x29, x30, [sp, #-16]!
	// x2 holds the count of the element we want to process
	mov x2, x0
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

	adr x0, count
	ldr x0, [x0]
	// this puts a pointer to the memory address of the first
	// element of the array into x1.
	adr x1, array
	bl arraySum
	
	ldp x29, x30, [sp], #16
	mov x0, #0
	ret
