	.data
varA:	.quad 10
varB:	.quad 60
varC:	.quad 50
value:	.quad 0
divzero:	.quad 0
	
	.text
	.global main
main:
	adr x0, varA
	ldr x0, [x0]
	adr x1, varB
	ldr x1, [x1]
	adr x2, varC
	ldr x2, [x2]

	// we want to calculate:
	// value = (varA * -100) / (varB - varC)
	// update conditional flag to check if divisor is 0
	subs x3, x1, x2		// varB - varC
	beq zero

	// now calculate numerator
	mov x4, #-100
	mul x5, x0, x4		// varA * -100

	// divide using signed division
	// store the solution in x5
	sdiv x5, x5, x3
	adr x0, value
	str x5, [x0]
	b end

zero:
	// this will set the value of divzero to 1,
	// indicating a division by 0 will occur.
	adr x0, divzero
	mov x1, #1
	str x1, [x0]

end:	
	mov x0, #0
	ret
