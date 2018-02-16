#Author: Yara Angel Brambila
#Date: Feb 16, 2018
#Fibonacci 

#F(n) = 1,1,2,3,5,8,13,21,34,55... empezando con n=0

.data

.text

main:
	li $a0, 9		#a0 = n -> n�mero de elementos deseados
	jal fibonacci		#llamar a la funci�n
	j exit			#fin del programa
fibonacci:
	slti $t0, $a0, 2	#si n<2, t0 = 1
	beq $t0, $zero, rec	#si t0 != 1, entonces aplica recursividad
	addi $v0, $zero, 1	#si no, entonces es caso base -> 1
	jr $ra			#salir del caso base al main
rec:				
	#STACK
	addi $sp, $sp, -12	#reservar espacio
	sw $ra, 8($sp)		#push
	sw $s0, 4($sp)		#push
	addi $a0, $a0, -1	#n = n-1
	#STACK
	sw $a0, 0($sp)		#push
	jal fibonacci		#llamar a fibonacci con n-1
	#STACK
	lw $a0, 0($sp)		#pop
	add $s0, $zero, $v0	#s0 = aux, para conservar v0
	addi $a0, $a0, -1	#n = n-2
	jal fibonacci		#llamar a fibonacci con n-2
	add $v0, $s0, $v0	#hacer la suma fibonacci(n-1) + fibonacci(n-2)
	#STACK
	lw $s0, 4($sp)		#pop
	lw $ra, 8($sp)		#pop
	addi $sp, $sp, 12	
	jr $ra			#salir de recursividad a main
exit: