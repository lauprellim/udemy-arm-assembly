	.text
	.global main
main:
	mov x0, #100
	// we will get 0 in x1
	// subs x1, x0, #100

	// this is not 0 in x1, so we will not branch to the end label
	subs x1, x0, #50
	beq end

	mov x2, #10
	// zero flag is cleared, so we will take the next bne instruction
	bne end

	mov x3, #20

	// if beq works, we will NOT execute the following line:
	// mov x2, #10
end:	
	mov x0, #0
	ret
