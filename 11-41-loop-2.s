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

	// we want to implement a do while loop:
	// do
	//	x++
	// while (x <= y)

dowhile:
	// increment x2 (x2++)
	add x2, x2, #1
	// we don't necessarily have to write the value
	// back to the variable here, so the next line can
	// be removed. only increment register in endwhile: block
	// str x2, [x0]

	// test condition of loop
	cmp x2, x3
	// branch if less than or equal to
	ble dowhile

	// control will fall through this if loop is over

endwhile:
	str x2, [x0]
	mov x0, #0
	ret
