/* this is the second program
helps visualize registers and variables in ddd
 */

 .data
counter: .quad 10

 .text
 .global main
 main:
    mov x2, #100
    ldr x0, =counter
    ldr x1, [x0]
    mov x0, #0
    ret