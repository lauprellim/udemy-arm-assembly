	// this is going to convert all the letters in string from
	// lower case to upper case.

	.data
	// asciz means string is terminated by null character
input:	.asciz "hello everyone"
	.text
	.global main
main:
	// convert lower case to upper case
	adr x0, input

loop:	
	// if we encounter null character, it's the end of the string
	// load first byte into w1
	ldrb w1, [x0]
	cmp w1, #0
	beq endloop

	// check for non-letter characters such as spaces...
	cmp w1, 'a'
	blo cont
	cmp w1, 'z'
	bhi cont

	// convert one character lc to uc
	sub w1, w1, #32
	// congratulations, we have updated the first character in the string

cont:	
	// update x0 to point to the next memory position!
	// we will use POST-INDEXED ADDRESSING.
	// strb instruction means "Store Register Byte"
	// this REPLACES the original letter with the new one in w1.
	// so we are updating TWO registers, w1 and x0 with this one
	// instruction. x0 being the memory address has to be advanced
	// and w1 being the string also gets changed.
	strb w1, [x0], #1
	b loop

endloop:	
	mov x0, #0
	ret
