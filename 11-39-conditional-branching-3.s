	.text
	.global main
main:
	mov x0, #20
	cmp x0, #15
	// 20 > 15, so condition bgt is true
	bgt end

	mov x1, #1000
	
end:
	mov x0, #0
	ret
