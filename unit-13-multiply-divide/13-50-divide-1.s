	.text
	.global main
main:
	// 100 divided by 2
	mov x0, #100
	mov x1, #2
	// check for divide by 0
	cmp x1, #0
	beq div0
	
	udiv x2, x0, x1
	b end
	
	// -100 divided by 50
	mov x3, #-1000
	mov x4, #50
	sdiv x5, x3, x4

div0:
	// handle divide by 0 somehow...
	
end:	
	mov x0, #0
	ret
