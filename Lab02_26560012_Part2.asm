# Listing 4 - the index of the element is held in a register

# Register plan:  $s0 = address of scores[0]   $s1 = i

.data

scores: .word 40, 55, 70, 85, 100

msg:    .asciiz "Total:  "

nl:     .asciiz "\n"

 

.text

.globl main

main:

    la   $s0, scores      # $s0 = address of scores[0]

    addi $s1, $zero, 2    # k = 2
    
    addi $s2, $zero, 33	  # V = 33

    sll  $t1, $s1, 2      # $t1 = 4 * k

    add  $t1, $t1, $s0    # $t1 = address of scores[i]
    
    sw	 $s2, 0($t1) 

    lw   $t2, 0($t1)      # $t2 = scores[i]
    
    #Total
    add $s3, $zero, $zero
    
    lw	$t0, 0($s0)
    
    add $s3, $s3, $t0
    
    lw	$t0, 4($s0)
    
    add $s3, $s3, $t0
    
    lw	$t0, 8($s0)
    
    add $s3, $s3, $t0
    
    lw	$t0, 12($s0)
    
    add $s3, $s3, $t0
    
    lw	$t0, 16($s0)
    
    add $s3, $s3, $t0
    
    #print Total
    
    li   $v0, 4

    la   $a0, msg

    syscall

    li   $v0, 1

    add  $a0, $s3, $zero

    syscall

    li   $v0, 4

    la   $a0, nl

    syscall

    li   $v0, 10

    syscall
    
    

