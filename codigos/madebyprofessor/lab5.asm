	.data
str1:	.asciiz "Digite o valor de A: "
str2:	.asciiz "Digite o valor de B: "
msg1:	.asciiz "A > B"
msg2:	.asciiz "A <= B"
	.text
	.globl main

main:
	#Imprimir str1
	li $v0, 4
	la $a0, str1
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t0, $v0
	
	#Imprimir str2
	li $v0, 4
	la $a0, str2
	syscall
	
	#receber o numero do terminal
	li $v0, 5
	syscall
	move $t1, $v0
	
	beq $t0, $t1, else
	slt $s0, $t1, $t0
	beq $s0, $zero, else
	j if
	
else:
	#Imprimir msg2
	li $v0, 4
	la $a0, msg2
	syscall
	j end
	
if:
	#Imprimir msg1
	li $v0, 4
	la $a0, msg1
	syscall	
	
end: 

	li $v0, 10
	syscall
