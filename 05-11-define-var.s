.data
// name size value
// byte = 1 byte
// hword = 2 bytes
// word = 4 bytes
// quad = 8 byte
sum: .quad 20

.text
.global main
main:
    ldr x0, =sum
    ldr x0,[x0]
    ret