.text
main:
  addi $s0, $zero, 2

  jal add_1
  move $s0, $s2

  li $v0, 1
  addi $a0, $s0, 0
  syscall

  j exit
  
add_1:
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  addi $s1, $s0, 1
  jal add_2
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

add_2:
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  addi $s2, $s1, 2
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

exit:
.end