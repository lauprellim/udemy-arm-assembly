	// this is going to demonstrate how you can save register values
	// onto the stack. Then we will change some of those register values
	// by doing some simple add and subtract instructions. Finally we
	// RESTORE these values using the ldp instruction.

	.text
	.global main
main:
	// load some values into registers...
	mov x0, #0
	mov x1, #10
	mov x2, #20
	mov x3, #30
	mov x4, #40
	mov x5, #50
	
	// store six registers on stack, each register is 8 bytes
	// ! means decrement the stack pointer by 48, which will
	// point to current top of stack.
	// stack pointer should be 16 byte aligned
	stp x0, x1, [sp, #-48]!
	stp x2, x3, [sp, #16]
	stp x4, x5, [sp, #32]

	// change the data stored in the registers by doing some
	// simple arithmatic...
	add x0, x0, x1
	sub x2, x3, x2
	add x4, x5, x2

	// then finally watch the original values we assigned
	// magically reappear as they are loaded back into the
	// registers from the stack!
	// use load pair instruction
	ldp x4, x5, [sp, #32]
	ldp x2, x3, [sp, #16]
	// increment stack pointer by 48 to restore it
	ldp x0, x1, [sp], #48
	
	mov x0, #0
	ret
