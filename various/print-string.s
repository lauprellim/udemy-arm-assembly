	.text
	.global main
main:
	mov x8, 64	// write system call for writing to stdout
	mov x0, 1	// specifies file descriptor for writing to stdout
	adr x1, message	// put the memory location of message: into x1
	mov x2, 14	// message length
	svc 0		// call the kernel (call the system call)
	mov x8, 93	// sets the sstem call number for exiting
	mov x0, 0	// return code is 0 ("return 0;")
	svc 0		// calls system call to exit
message:
	// the string to be printed...
	.ascii "Hello, World!\n"
