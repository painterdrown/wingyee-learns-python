.data
  a:
    .space 40
  str1:
    .asciiz "Enter 10 numbers:\n"
  str2:
    .asciiz "After sorting:"

.text
.globl main

main:
  la   $t0, a                             # $t0 = &a[0]
  add  $t1, $zero, $zero                  # i = 0
  la   $a0, str1
  li   $v0, 4
  syscall
  READ:
    li   $v0, 5                         # read an int
    syscall
    sw   $v0, 0($t0)                    # save the int just read to $t0
    addi $t0, $t0, 4                    # move $t0 to next position
    addi $t1, $t1, 1                    # ++i
    bne  $t1, 10, READ

  la   $t0, a                             # $t0 = &a[0]
  add  $t1, $zero, $zero                  # i = 0
  LOOP_1:
    add  $t3, $t1, $zero                # m = i
    addi $t2, $t1, 1                    # j = i + 1
    LOOP_2:
      sll  $t5, $t3, 2                # delta = m * 4
      add  $t6, $t0, $t5              # $t6 = &a[m]
      lw   $t6, ($t6)                 # $t6 = a[m]
      sll  $t5, $t2, 2                # delta = j * 4
      add  $t7, $t0, $t5              # $t7 = $a[j]
      lw   $t7, ($t7)                 # $t7 = a[j]
      bgt  $t6, $t7, ELSE_2
      UPDATE_M:
        add  $t3, $t2, $zero
      ELSE_2:
        addi $t2, $t2, 1            # ++j
        bne  $t2, 10, LOOP_2

    beq  $t3, $t1, ELSE_1
    SWAP:
      sll  $t5, $t1, 2                # delta = i * 4
      add  $t6, $t0, $t5              # $t6 stores &a[i]
      sll  $t5, $t3, 2                # delta = m * 4
      add  $t7, $t0, $t5              # $t7 stores &a[m]
      lw   $t4, ($t6)                 # t = a[i]
      lw   $t5, ($t7)                 # a[i] = a[m];
      sw   $t5, ($t6)
      sw   $t4, ($t7)                 # a[m] = t;
    ELSE_1:
      addi $t1, $t1, 1                # ++i
      bne  $t1, 9, LOOP_1

  la   $t0, a                             # load the address of a to $t0
  add  $t1, $zero, $zero                  # i = 0
  la   $a0, str2
  li   $v0, 4
  syscall
  PRINT:
    li   $a0, ' '
    li   $v0, 11
    syscall
    lw   $a0, ($t0)                     # load the int to $a0 to be printed
    li   $v0, 1
    syscall
    addi $t0, $t0, 4                    # move $t0 to next position
    addi $t1, $t1, 1                    # i++
    bne  $t1, 10, PRINT

  li   $v0, 10
  syscall
