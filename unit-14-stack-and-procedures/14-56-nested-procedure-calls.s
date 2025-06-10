	// These procedures call each other. But each time
	// we move to a new procedure, the return address of
	// the previous procedure is stored in x30. By the
	// time we get to proc3, we have overwritten that
	// address, and we cannot get back to the previous
	// procedure.
	//
	// The solution is to store the return address on the
	// stack. We will store 8 values in all on the stack.
	// They are all offset by 16 bytes
	// in ddd, examine 8 vars in hexadecimal, giants(8)
	// and start at sp register value-64
	//
	// You will witness the return addresses getting stored
	// in the stack, one after the other; then, you will
	// have the joy of viewing them moving back to sp
	// register so the program knows where to return to!
	
	.text
	.global main

proc3:
	stp x29, x30, [sp, #-16]!
	mov x1, #0
	ldp x29, x30, [sp], #16
	ret

proc2:
	stp x29, x30, [sp, #-16]!
	bl proc3
	ldp x29, x30, [sp], #16
	ret
	
proc1:
	stp x29, x30, [sp, #-16]!
	bl proc2
	ldp x29, x30, [sp], #16
	ret
	
main:
	stp x29, x30, [sp, #-16]!
	bl proc1
	ldp x29, x30, [sp], #16
	
	mov x0, #0
	ret
