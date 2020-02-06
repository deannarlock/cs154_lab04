.data
a: .word 		0x3, 0x5, 0x2, 0x1, 0x7
end_line: .asciiz 	" units.\n"
	
	
.text	
#assumes int m stored in $a0 ant int n in $a1
rick:
	add $t0, $a0, $a0
	sub $v0, $t0, $a1
	jr $ra


main:	

	#b stored in $s0, v stored in $s1, adress of a stored in $s2
	addi $s0, $zero, 0x2
	la $s2, a

	#i will be stored in $s3
	add $s3, $zero, $zero
	addi $s4, $zero, 0x5
Loop:	
	slt $t0, $s3, $s4
	beq $t0, $zero, End_Loop

If:
	#$t1 stores a[i]
	sll $t1, $s3, 2
	add $t0, $s2, $t1
	lw $t1, 0($t0)

	slt $t0, $s0, $t1
	beq $t0, $zero, Else

	add $a0, $t1, $zero
	add $a1, $s0, $zero

	jal rick
	add $a0, $v0, $zero
	j End_If

Else:
	add $a0, $zero, $zero

End_If:
	addi $v0, $zero, 0x1
	syscall

	addi $v0, $zero, 0x4
	la $a0, end_line
	syscall
	
	addi $s3, $s3, 0x1

	j Loop


End_Loop:	
		
	li $v0, 10
	syscall
