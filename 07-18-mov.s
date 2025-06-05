	.text
	.global main
main:
	// mov
	// movz
	// movk
	// mov reg, source

	mov x0, #1000
	mov x1, x0
	// this will not work
	// mov x0, #0x12345

	movz x2, #0x2345
	movk x2, #1, lsl #16

	// 0x1234567890abcdef
	movz x3, #0xcdef
	movk x3, #0x90ab, lsl #16
	movk x3, #0x5678, lsl #32
	movk x3, #0x1234, lsl #48

	mov w2, #1000
	
	mov x0, #0
	ret
