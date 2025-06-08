	.data

	.text
	.global main
main:
	mov x0, #-1024
	asr x1, x0, #9
	
	mov x0, #0
	ret
