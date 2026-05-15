	.data
str1:	.asciiz "Digite o primeiro numero: "
str2:	.asciiz "Digite o segundo numero: "
str3:	.asciiz "Resultado: "

	.text
	.globl main

main:
	#Imprimir str1
	la $a0, str1
	jal print_str
	
	#receber o numero do terminal
	jal read_int
	move $t0, $v0
	
	#Imprimir str2
	la $a0, str2
	jal print_str
	
	#receber o numero do terminal
	jal read_int
	move $t1, $v0
	
	sub $s0, $t0, $t1
	
	#Imprimir str3
	la $a0, str3
	jal print_str
	
	#Imprimir o int
	move $a0, $s0
	jal print_int
	
end:		
	#Encerrar
	li $v0, 10
	syscall
	
	
print_str:	#necessario passar o endereco da string para $a0 antes de chamar essa rotina
	li $v0, 4
	syscall
	jr $ra
	
print_int:	#necessario passar o valor do inteiro para $a0 antes de chamar essa rotina
	li $v0, 1
	syscall
	jr $ra
	
read_int:
	li $v0, 5
	syscall
	jr $ra