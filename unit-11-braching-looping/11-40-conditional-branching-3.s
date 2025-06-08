	.data
// try changing x to 90
x:	.quad 10
y:	.quad 50
z:	.quad 10

	.text
	.global main
main:
	// load all variables into registers
	ldr x0, =x
	ldr x1, =y
	ldr x2, =z
	ldr x3, [x0]
	ldr x4, [x1]
	ldr x5, [x2]

	// this is a more complex expression...
	// if (x > y AND y > z)
	// 	set x = 100
	// endif
if:
	// if this is false, branch to endif
	// this is the "short circuit" method, since in all AND
	// expressions, if the first term is false, the whole
	// entire expression is false.
	cmp x3, x4
	ble endif

	cmp x4, x5
	ble endif

	// if we reach this point, BOTH terms are TRUE
	// so we will assign the value 100 to variable x
	// just to show that we reached here.
	mov x3, #100
	str x3, [x0]

endif:	
	mov x0, #0
	ret
