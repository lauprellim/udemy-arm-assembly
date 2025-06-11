	// macro is basically a named block of code that can be
	// called by a program

	// This macro will clear one register
	// The parameter it will take in is the register to be cleared.
	// Parameter name = "register"
	
	.macro zero register
		mov \register, #0
	.endm
		
	.text
	.global main
main:
	// we pass x0 to the macro
	zero x0
	zero x1
	zero x2
	zero x3
	ret
