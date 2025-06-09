	// get remainder while dividing
	.text
	.global main
main:
	// x3 = 100 % 7
	mov x0, #100
	mov x1, #7

	// check divide by 0 case
	cmp x1, #0
	beq div0
	
	udiv x2, x0, x1

	// again, this confusing instuction translates to:
	// x3 = x0 - (x2 * x1)
	msub x3, x2, x1, x0
	b end
	
div0:
	// handle divide by 0 error
end:	
	mov x0, #0
	ret
