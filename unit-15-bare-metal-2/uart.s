	// this may be 0x7e201000
	.equ IO_BASE_ADDR,	0xfe200000

	.equ UART0_DR,		IO_BASE_ADDR + 0x1000
	.equ UART0_FR,		IO_BASE_ADDR + 0x1018
	.equ UART0_CR,		IO_BASE_ADDR + 0x1030
	.equ UART0_LCRH,	IO_BASE_ADDR + 0x102c
	.equ UART0_FBRD,	IO_BASE_ADDR + 0x1028
	.equ UART0_IBRD,	IO_BASE_ADDR + 0x1024
	.equ UART0_IMSC,	IO_BASE_ADDR + 0x1038

	.section .text
	.global write_string
	.global write_char
	.global read_char
	.global init_uart

read_char:
	// this code is almost exactly the same as write_char:
	// so it is all commented there.
	stp x29, x30, [sp, #-16]!

1:
	ldr x0, =UART0_FR
	bl in_word
	// check bit 4 instead of bit 5
	tst x0, (1 << 4 )
	bne 1b

	ldr x0, =UART0_DR
	bl in_word
	// data is now saved in x0
	
	ldp x29, x30, [sp], #16
	ret
	
write_char:
	stp x29, x30, [sp, #-16]!
	// store character on top of stack
	str x0, [sp, #-16]!
	
1:
	// check state of device, is it ready to send data?
	// if bit 5 is 1, transimit FIFO buffer is full. WAIT.
	// if bit 4 is clear, we are ready
	ldr x0, =UART0_FR
	bl in_word

	tst x0, (1 << 5)
	// jump if zero flag is clear
	bne 1b

	// retrieve character from top of stack
	ldr x1, [sp]
	ldr x0, =UART0_DR
	// write data to data register
	bl out_word
	
	ldr x0, [sp], #16	
	ldp x29, x30, [sp], #16
	ret

write_string:
	stp x29, x30, [sp, #-16]!
	str x19, [sp, #-16]!
	
	// if we find null character we have reached end of string
	// x19 is used as the capture
	mov x19, x0
1:	
	ldrb w0, [x19], #1
	tst w0, w0
	// if it is zero, it is end of string
	beq 2f

	// if capture is a valid one, call function write_char
	bl write_char
	b 1b

2:	
	ldr x19, [sp], #16
	ldp x29, x30, [sp], #16
	ret
	
init_uart:
	stp x29, x30, [sp, #-16]!

	mov x1, #0
	ldr x0, =UART0_CR
	bl out_word

	// configure baud rate
	// this is 48000000 / (16 * 115200) = 26.04
	mov x1, #26
	ldr x0, =UART0_IBRD
	bl out_word

	mov x1, #0
	ldr x0, =UART0_FBRD
	bl out_word

	// enable transmit and recieve FIFO buffer, bits 4, 5, 6
	mov x1, #(1 << 4) | (1 << 5) | (1 << 6)
	ldr x0, =UART0_LCRH
	bl out_word

	// mask interrupt because we don't use them
	mov x1, #0
	ldr x0, =UART0_IMSC
	bl out_word

	// enable UART0. Bit 0 is enable bit
	mov x1, #(1 << 0) | (1 << 8) | (1 << 9)
	ldr x0, =UART0_CR
	bl out_word
	
	ldp x29, x30, [sp], #16
	ret
