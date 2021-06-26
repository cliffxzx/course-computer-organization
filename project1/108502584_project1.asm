.data
    inputStr: .asciiz "Give two numbers: "
    outputStr: .asciiz "The GCD of two numbers: "
    endline: .asciiz "\n"
.text
main:
    # Give Input message and store input numbers to $a0 and $a1
    li $v0, 4
    la $a0, inputStr
    syscall
    li $v0, 5
    syscall
    add $a0, $v0, $zero
    li $v0, 5
    syscall
    add $a1, $v0, $zero
    # TODO: The condition of the process terminated
    bne $a0, $zero, run
    bne $a1, $zero, run
    j exit

run:
    # call GCD function recursively
    jal GCD
    add $t0, $v0, $zero

    # print the answer
    li $v0, 4
    la $a0, outputStr
    syscall
    add $a0, $t0, $zero
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, endline
    syscall
    j main
# END Main

GCD:
    # save in the stack
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    add $s0, $a0, $zero
    add $s1, $a1, $zero

    beq $s0, $zero, retGCD

    # TODO: Do Euclidean Algorithm
gcdwithoutrecursive:
    beq $s0, $zero, returns1
    beq $s1, $zero, returns0

    div $s1, $s0
    add $s1, $s0, $zero
    mfhi $s0

    j gcdwithoutrecursive



return:
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    addi $sp, $sp, 12
    jr $ra

retGCD:
    # TODO: What do you need to return?
returns1:
	add $v0, $s1, $zero
    j return

returns0:
	add $v0, $s0, $zero
    j return



# END GCD

exit:
    # The program is finished running
    li $v0, 10
    syscall
