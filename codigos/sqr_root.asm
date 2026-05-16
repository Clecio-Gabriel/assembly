	.data 
str1:	.asciiz "Deseja digitar um novo numero?\n(Digite 0 para encerrar)\n"
str2:	.asciiz ": raiz "
str3:	.asciiz "Sistema encerrado.\n"
str4:	.asciiz "\n"
str5:	.asciiz "Resultado invalido.\n"
	.text
	.globl ini

ini:
	li $t0, 0
	li $t1, 10
	
	#CREATE INPUT VECTOR
	li $a0, 80
	li $v0, 9
	syscall
	move $s5, $v0	#INPUT VECTOR IN $S5
	
	#CREATE SQROOT VECTOR
	li $a0, 80
	li $v0, 9
	syscall
	move $s6, $v0	#SQROOT VECTOR IN $S6
	
main:
	beq $t0, $t1, printloop

	li $v0, 4	#To print a string
	la $a0, str1	#Load the str1 address
	syscall 	#call the system
	
	li $s0, 0	# input variable
	li $v0, 5	# to read an integer
	syscall 
	move $s0, $v0
	
	beq $s0, $zero, printloop	# to check if the user wants to keep going
	
	li $s1, 1	# R <= 1
	li $s2, 2	# D <= 2
	li $s3, 4	# S <= 4
	j loopSquare
	
loopSquare:
	blt $s0, $s3, check	#if input < S, end the loop
	
	add $s4, $s3, $zero
	addi $s1, $s1, 1	# R += 1
	addi $s2, $s2, 2	# D += 2
	add $s3, $s3, $s2	# S <= S + D
	addi $s3, $s3, 1	# S += 1
	
	j loopSquare

check:
	li $t9, 1
	beq $s0, $t9, insertinvec
	bne $s0, $s4, invalidres
	
	j insertinvec

insertinvec:
	addi $t0, $t0, 1	#I += 1
	
	add $t5, $s5, $t3
	sw $s0, 0($t5)
	
	beq $s0, $t9, rootins1
	
	add $t6, $s6, $t3
	sw $s1, 0($t6)
	
	addi $t3, $t3, 4
	
	j main

rootins1:
	li $s7, 1
	add $t6, $s6, $t3
	sw $s7, 0($t6)
	
	addi $t3, $t3, 4
	
	j main

invalidres:
	li $v0, 4
	la $a0, str5
	syscall 
	
	j main	
			
printloop:	
	beq $t2, $t0, end
	
	add $t7, $s5, $t4
	li $v0, 1
	lw $a0, 0($t7)
	syscall
	
	li $v0, 4
	la $a0, str2
	syscall
	
	add $t8, $s6, $t4
	li $v0, 1
	lw $a0, 0($t8)
	syscall
	
	li $v0, 4
	la $a0, str4
	syscall
	
	addi $t2, $t2, 1
	addi $t4, $t4, 4
	
	j printloop

end:
	
	li $v0, 4
	la $a0, str3
	syscall
	
	li $v0, 10
	syscall