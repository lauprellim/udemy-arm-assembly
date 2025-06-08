	.text
	.global main
main:
	// add of subtract reg, src1, operand2
	mov x0, #1000
	mov x1, x0

	add x2, x0, #1
	add x3, x0, x1

	// x0 + x1 * 2
	add x4, x0, x1, lsl #1

	// x0 + x1 / 2
	// use asr to preserve sign of value
	add x5, x0, x1, asr #1

	mov w6, #-1
	// x6 is not a negative number because its upper bits are all 0
	add x7, x0, x6
	add x8, x0, x6, sxtw
	
	mov x0, #0
	ret
