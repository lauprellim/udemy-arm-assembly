	.data
x:	.quad 10
// try setting y to a greater number than x also
y:	.quad 5
	
	.text
	.global main
main:
	ldr x0, =x
	ldr x1, =y
	ldr x2, [x0]
	ldr x3, [x1]

	// if (x > y)
	// set x = 100
	// else set y = 200
	// endif

if:	
	cmp x2, x3
	// ble = branch if less than or equal to
	// ble is one of the *signed* operation branching instructions
	// this is sort of like the "opposite check"
	ble else

	mov x4, #100
	// writes the value in x4 back to the VARIABLE x, of course
	str x4, [x0]
	// jump over else block
	b endif
	
else:
	mov x4, #200
	str x4, [x1]

endif:	
	mov x0, #0
	ret
