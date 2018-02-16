#Author: Yara Angel Brambila
#Date: Feb 16, 2018
#Fibonacci 

.data

.text

main:
	li $a0, 4
	jal fibonacci
	j exit
	
fibonacci:
	slti $t0, $a0, 2	#a0 = n, si n<2, t0 = 1
	beq $t0, $zero, loop	#si t0 != 1, entonces aplica recursividad
	addi $v0, $zero, 1	#si no, entonces es caso base
	jr $ra
loop:				
	addi $a0, $a0, -1	#n = n-1
	jal fibonacci		#llamar a fibonacci con n-1
	add $s0, $zero, $v0	#s0 = aux
	addi $a0, $a0, -1	#n = n-2
	jal fibonacci		#llamar a fibonacci con n-2
	add $v0, $s0, $v0	#hacerla suma fibonacci(n-1) + fibonacci(n-2)
	jr $ra
exit:
