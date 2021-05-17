.data
N:
.word 5
M:
.word 6
matrix:
.word -1, -1, -1,  1,  1,  1,
.word  1,  1,  1,  1,  1,  1,
.word  1,  1,  1,  1,  1,  1,
.word  1,  1,  1,  1,  1,  1,
.word  1,  1,  1,  1,  1,  1,
positiveNumbersCount:
.word 0
negativeNumbersCount:
.word 0

.text

main:
la t0, N # get the address of N
lw a2, 0(t0) # load N
la t0, M # get the address of M
lw a3, 0(t0) # load M
la a4, matrix # get the address of the first matrix element
la a5, positiveNumbersCount # get the address of positiveNumbersCount
la a6, negativeNumbersCount # get the address of negativeNumbersCount
call FindPositiveAndNegativeNumbersCount
call print
sw s1, 0(a5) # store positiveNumbersCount
sw s2, 0(a6) # store negativeNumbersCount
call exit

FindPositiveAndNegativeNumbersCount:
li s1, 0 # temp reg for positiveNumbersCount
li s2, 0 # temp reg for negativeNumbersCount
j rowCycle
exitFromRowCycle:
ret

rowCycle:
li t0, 0 # row pointer
continueRowCycle:
bge t0, a2, exitFromRowCycle
#blt t4, t0, rowCycle
addi t0, t0, 1
j columnCycle
exitFromColumnCycle:
j continueRowCycle

columnCycle:
li t1, 0 # column pointer
continueColumnCycle:
bge t1, a3, exitFromColumnCycle
addi t1, t1, 1
lw s9, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
bgtz s9, incrementPositiveNumbersCount
bltz s9, incrementNegativeNumbersCount
j continueColumnCycle

incrementPositiveNumbersCount:
addi s1, s1, 1
j continueColumnCycle

incrementNegativeNumbersCount:
addi s2, s2, 1
j continueColumnCycle

print:
li x10, 1 # set integer mode
mv x11, s1 # x11 content will be displayed in console
ecall
li x10, 11 # set char mode 
li x11, 13 # ASCII 13 - new line
ecall
li x10, 1 
mv x11, s2 
ecall
li x10, 11 
li x11, 13 
ecall
ret

exit:
addi a0, x0, 10
ecall
