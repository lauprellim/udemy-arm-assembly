	.text
	.global main
main:
	// b dest
	b end
	// another way of branching is to store the address
	// of the label in a register, then use "br" instruction!
	// ldr 0, =end
	// br x0
	mov x1, #1
	add x2, x1, #2
end:	
	mov x0, #0
	ret
