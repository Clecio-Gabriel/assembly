	.data 
str1:	.asciiz "Deseja digitar um novo numero? "
str2:	.asciiz ": raiz "
	.text
	.globl main

main:
	li $v0, 4	#To print a string
	la $a0, str1	#Load the str1 adress
	syscall 	#call the system
	
	li $s0, 0	# input variable
	li $v0, 5	# to read an integer
	syscall 
	move $s0, $v0
	
	li $s1, 1	# R <= 1
	li $s2, 2	# D <= 2
	li $s3, 4	# S <= 4
	j loopSquare
	
loopSquare:
	blt $s0, $s3, check	#if input < S, end the loop
	
	addi $s1, $s1, 1	# R += 1
	addi $s2, $s2, 2	# D += 2
	add $s3, $s3, $s2	# S <= S + D
	addi $s3, $s3, 1	# S += 1
	
	j loopSquare

check:
	
	j end
	
end:	
	
