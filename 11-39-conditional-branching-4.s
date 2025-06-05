	.text
	.global main
main:
	// we are going to compare and branch using signed numbers
	mov x0, #-10
	cmp x0, #10
	// this will be true because left < right, or
	// in other words, -10 < 10
	blt end

	// so of course this instruction will not be executed.
	mov x1, #1000
	
end:
	mov x0, #0
	ret
