.text


#int x stored in $a0
jerry:
	
	addi $t0, $a0, 0x2
	add $t1, $t0, $t0
	add $v0, $t1, $t0

	jr $ra

#int y stored in $a0
morty:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)

	add $s0, $a0, $zero

	add $t0, $s0, $s0
	addi $a0, $t0, 0xfffffffa
	jal jerry
	add $s1, $v0, $zero

	add $a0, $s1, $zero
	jal jerry
	add $v0, $v0, $s1  

	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	add $sp, $sp, 12
	
	jr $ra

	
main:

	add $a0, $zero, 0x5
	jal morty

	sll $a0, $v0, 2
	addi $v0, $zero, 0x1
	syscall

	
	li $v0, 10
	syscall
