	.text
	.global main
main:
	// tst src1, operand2
	// sets a flag, does not modify operands
	mov x0, #0b101011
	// check if bit 3 is set in x0 register
	mov x1, #0b001000
	tst x0, x1
	// check zero flag

	mov x2, #0b10001100
	// check if bits 0 and 3 are set
	mov x3, #0b00001001
	tst x2, x3
	// if either bits 0 or 3 are set, result will be nonzero,
	// and zero flag will be cleared.

	mov x4, #0b10000100
	tst x4, x3
	// zero flag will be set
	// because 0 and 3 in x4 are both 0
	// hence zero flat will be set...
	
	mov x0, #0
	ret
