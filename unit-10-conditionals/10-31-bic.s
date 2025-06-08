	.text
	.global main
main:
	// clear bit 2 and bit 7
	mov x0, #0b10010110
	mov x1, #0b01111011
	and x2, x0, x1

	// another way to clear bits 2 and 7
	mov x3, #0b10000100
	bic x4, x0, x3

	// clear bit 4 and bit 5
	mov x5, #0b11110001
	mov x6, #0b11001111
	and x7, x5, x6

	// another way of doing that
	mov x8, #0b00110000
	bic x9, x5, x8
	
	mov x0, #0
	ret
