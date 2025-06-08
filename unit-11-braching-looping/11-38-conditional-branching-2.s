	.text
	.global main
main:
	mov x0, #5
	# 5 > 1 is true
	cmp x0, #1
	// will branch to end label because 5 > 1
	// bhi end

	// will NOT branch, because it is FALSE that 5 < 1
	blo end
	
	mov x1, #10

end:	
	mov x0, #0
	ret
