	.data
x:	.quad 0
y:	.quad 10

	.text
	.global main
main:
	ldr x0, =x
	ldr x1, =y
	ldr x2, [x0]
	ldr x3, [x1]

	// we want to implement this while loop:
	// while (x <= y)
	//	x++
	// end while

while:
	cmp x2, x3
	// use opposite check
	// signed comparison
	// if this evaluates to false, jump to end
	// if it evaluates to true, we enter the loop
	bgt endwhile

	// now we're inside the loop
	// increment x2 (obviously same as x++)
	add x2, x2, #1
	// write value of x2 back to variable x
	str x2, [x0]
	// now we need an unconditional branch
	// back to the beginning of the while loop
	b while
	
endwhile:	
	mov x0, #0
	ret
