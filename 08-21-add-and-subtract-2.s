	.text
	.global main
main:
	// add or subtract reg, src1, operand2
	mov x0, #1000
	mov x1, #500

	// 1000 - 1
	sub x2, x0, 1
	sub x3, x0, x1

	// equivalent to x4 = x0 - (x1 << 1)
	sub x4, x0, x1, lsl #1
	sub x5, x0, x1, asr #1

	mov w6, #-100
	// incorrect result
	sub x7, x0, x6
	// correct
	sub x8, x0, x6, sxtw
	
	mov x0, #0
	ret
