.import lotsofaccumulators.s

.data
inputarray: .word 1,2,3,4,5,6,7,0

TestPassed: .asciiz "Test Passed!"
TestFailed: .asciiz "Test Failed!"

.text
# Tests if the given implementation of accumulate is correct.
#Input: a0 contains a pointer to the version of accumulate in question. See lotsofaccumulators.s for more details
#
#
#
#The main function currently runs a simple test that checks if accumulator works on the given input array. All versions of accumulate should pass this.
#Modify the test so that you can catch the bugs in four of the five solutions!
main:
    la a0 inputarray
    li s0,4 #check accumone
    li t2, 5 #check accumtwo and accumfour
    addi sp,sp,-4 #check accumfive
    lw t3,0(a0)   #check accumfive
    sw a0, 0(sp)   #check accumfive
    sw x0, 0(a0)   #check accumfive
    jal accumulatorfive
    li t0 27   #check accumfive
    beq a0 t0 Fail   #check accumfive
    lw a0,0(sp)   #check accumfive
    sw t3, 0(a0)   #check accumfive
    addi sp,sp,4   #check accumfive
    
    
    
    addi sp,sp,-4  #check accumtwo
    sw t2,0(sp)    #check accumtwo
    jal accumulatorfive
    lw  t2,0(sp)   #check accumtwo
    addi sp,sp,4   #check accumtwo
    li t0 4   #check accumone
    bne s0 t0 Fail  #check accumone
    li t0 5   #check accummtwo
    bne t2 t0 Fail   #check accumtwo
    
    li t0 28   #check for pass
    
    
    
    
    beq a0 t0 Pass  #Passed
Fail:
    la a0 TestFailed
    jal print_string
    j End
Pass:
    la a0 TestPassed
    jal print_string
End:
    jal exit

print_int:
	mv a1 a0
    li a0 1
    ecall
    jr ra
    
print_string:
	mv a1 a0
    li a0 4
    ecall
    jr ra
    
exit:
    li a0 10
    ecall