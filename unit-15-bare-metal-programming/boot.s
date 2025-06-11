	.section .text
// makes this available to the linker
	.global start
// label indicates start of our "kernel"
start:
	// read system register into general purpose register
	// multi processor affinity register at exception level 1
	// this contains identification information about the core or CPU
	// lower two bits hold info about the CPU because there
	// are 2 cores in the rp5
	mrs x0, mpidr_el1
	// mask other bits except the lowest 2
	ands x0, x0, #3
	// x0 holds info about the CPU. if it is zero, that's what
	// we're looking for
	beq kernel_entry

end:
	// this is an infinite loop
	b end
	
kernel_entry:
	// set stack pointer to 0x80000, this is where the
	// boot code is. Above 0x80000 is boot code. Below 0x80000
	// is stack (to 0x0). Move sp to below this 0x80000
	// prepare stack:
	mov sp, #0x80000
	bl main
	b end
	
