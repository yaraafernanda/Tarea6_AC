#Author: Yara Angel Brambila
#Date: Feb 16, 2018
#Fibonacci 

#F(n) = 1,1,2,3,5,8,13,21,34,55... empezando con n=0

.data

.text

main:
	li $a0, 4		#a0 = n 
	jal fibonacci		
	j exit			
fibonacci:
	slti $t0, $a0, 2	#si n<2, t0 = 1
	beq $t0, $zero, rec	#si t0 != 1, entonces salta
	addi $v0, $zero, 1	#si no, es caso base 
	jr $ra			
rec:				
	#STACK
	addi $sp, $sp, -12	
	sw $ra, 8($sp)		
	sw $s0, 4($sp)	
		
	addi $a0, $a0, -1	#n = n-1
	
	#STACK
	sw $a0, 0($sp)	
		
	jal fibonacci		#llamar a fibonacci con n-1
	
	#STACK
	lw $a0, 0($sp)	
		
	add $s0, $zero, $v0	#s0 = aux
	addi $a0, $a0, -1	#n = n-2
	jal fibonacci		#llamar a fibonacci con n-2
	add $v0, $s0, $v0	#hacer la suma fibonacci(n-1) + fibonacci(n-2)
	
	#STACK
	lw $s0, 4($sp)		
	lw $ra, 8($sp)		
	addi $sp, $sp, 12	
	
	jr $ra			
exit: