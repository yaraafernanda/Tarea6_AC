#Fibonacci 
#Yara Angel Brambila
.data

.text

fibonacci:
	slti $t0, $a0, 2
	beq $t0, $zero, base
general:
	addi $a0, $a0, -1
	jal fibonacci
	add $s0, $zero, $v0
	addi $a0, $a0, -1
	jal fibonacci
	add $v0, $a0, $v0
	j exitFibonacci
base:	
	add $v0, $a0, $zero
exitFibonacci:
	jr $ra
