// this is going to use constants 

// use .equiv to define this only once
// use .equ to store a symbol
.equ buffer_size, 500

.text
.global main
main:
    mov x0, #buffer_size
    mov x0, #0
    ret