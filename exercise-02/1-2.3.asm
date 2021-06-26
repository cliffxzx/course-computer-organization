.data
.text
main:
  addi $sp, $sp, -36
  add $s7, $zero, $sp
  addi $sp, $sp, -8
  add $s6, $zero, $sp

  addi $t0, $zero, 1
  sw $t0, 0($s7)
  addi $t0, $zero, 2
  sw $t0, 4($s7)
  addi $t0, $zero, 3
  sw $t0, 8($s7)
  addi $t0, $zero, 4
  sw $t0, 12($s7)
  addi $t0, $zero, 5
  sw $t0, 16($s7)
  addi $t0, $zero, 6
  sw $t0, 20($s7)
  addi $t0, $zero, 7
  sw $t0, 24($s7)
  addi $t0, $zero, 8
  sw $t0, 28($s7)
  addi $t0, $zero, 9
  sw $t0, 32($s7)
  addi $t0, $zero, 10
  sw $t0, 0($s6)
  addi $t0, $zero, 11
  sw $t0, 4($s6)

  addi $s3, $zero, 1
  addi $s4, $zero, 0

  sub $t0, $s3, $s4
  sll $t0, $t0, 2
  add $t0, $t0, $s6
  lw $t1, 0($t0)
  sw $t1, 32($s7)

  addi $sp, $sp, 8

  lw $t0, 0($s7)
  lw $t1, 4($s7)
  lw $t2, 8($s7)
  lw $t3, 12($s7)
  lw $t4, 16($s7)
  lw $t5, 20($s7)
  lw $t6, 24($s7)
  lw $t7, 28($s7)
  lw $t8, 32($s7)
  addi $sp, $sp, 32

  j exit

exit:
  li $v0, 10
  syscall
