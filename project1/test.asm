.data
    inputStr: .asciiz "Give two numbers: "
    outputStr: .asciiz "The GCD of two numbers: "
    endline: .asciiz "\n"
.text
main:
    # Give Input message and store input numbers to $a0 and $a1
    addi $t0, $zero, 0b11110100
    srl $t0, $t0, 1

    li $v0, 4
    la $a0, $t0
    syscall
# END Main
exit:
    # The program is finished running
    li $v0, 10
    syscall
