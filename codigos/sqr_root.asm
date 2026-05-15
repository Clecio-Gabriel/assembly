	.data 
str1:	.asciiz "Deseja digitar um novo numero? "
str2:	.asciiz ": raiz "
	.text
	.globl main

main:
	li $s0, 0	# input
	
	li $s1, 1	# R <= 1
	li $s2, 2	# D <= 2
	li $s3, 4	# S <= 4
	j loopSquare
	
loopSquare:
	blt $s0, $s3, end	#if input < S, end the loop
	addi $s1, $s1, 1	# R += 1
	addi $s2, $s2, 2	# D += 2
	add $s3, $s3, $s2	# S <= S + D
	addi $s3, $s3, 1	# S += 1
	j loopSquare
	
end:	
	