	.data
str1: .asciiz "\n"
str2: .asciiz "Input ordenado:\n"
	.text
	.globl input

input:

	li $s0, 0
	li $v0, 5
	syscall
	move $s0, $v0

	li $s1, 0
	li $v0, 5
	syscall
	move $s1, $v0

	li $s2, 0
	li $v0, 5
	syscall 
	move $s2, $v0

	j sort

s0ands1:
	slt $t0, $s1, $s0
	bne $t0, $zero, mvs0s1
	
	jr $ra
	
mvs0s1:
	add $t1, $s0, $zero
	move $s0, $s1
	add $s1, $t1, $zero
	
	jr $ra

s1ands2:
	slt $t0, $s2, $s1
	bne $t0, $zero, mvs1s2
	
	jr $ra

mvs1s2:
	add $t1, $s1, $zero
	move $s1, $s2
	add $s2, $t1, $zero
	
	jr $ra

sort:
	jal s0ands1
	jal s1ands2
	jal s0ands1
	
	j print

breakline:
	li $v0, 4
	la $a0, str1
	syscall
	
	jr $ra
	
print:

	jal breakline
	
	li $v0, 4
	la $a0, str2
	syscall
	
	li $v0, 1
	add $a0, $s0, $zero
	syscall

	jal breakline

	li $v0, 1
	add $a0, $s1, $zero
	syscall
	
	jal breakline

	li $v0, 1
	add $a0, $s2, $zero
	syscall
	
	jal breakline