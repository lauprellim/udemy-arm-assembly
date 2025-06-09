// This example is going to find a character in a string.
// also an opportunity to practice register offset addressing
	
	.data
input:	.asciz "hello everyone"
	// should be double-word aligned
	// since .quad is an 8-byte variable, we specify
	// that the lowest 3 bits of the address "found"
	// should be 0
	.align 3
found:	.quad 0

	.text
	.global main
main:
	adr x0, input
	adr x1, found

	// this is the character we are looking for
	mov x4, 'o'

	// x2 is an index. this means we start from the
	// first address in the string.
	mov x2, #0
	
search:
	// base address is in x0
	// index in x2
	// check if we have reached the end of the string
	// also shift right by 0 bits because index is equal to offset
	// in the string
	ldrb w3, [x0, x2, lsl #0]
	// check to see if this is the null terminating character;
	// if it is, branch to end:
	cmp w3, #0
	beq end

	// else,
	// compare current character with character we want
	cmp w3, w4
	// if this is NOT the character, increment out counter in x2
	bne cont

	// but if we find the character, put its address in x3
	mov x3, #1
	str x3, [x1]
	// and end the loop by branching to end:
	b end

cont:
	// this increments our counter address
	add x2, x2, #1
	b search

end:	
	mov x0, #0
	ret
