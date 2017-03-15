me: Thomas Chin
; Email:  tchin006@ucr.edu
; 
; Lab: lab 6
; Lab section: 022
; TA: O'Neill
;=================================================

.orig x3000
  LD R5, SUB_APPLE
  JSRR R5
  LD R5, SUB_PEAR
  JSRR R5
  
  HALT


;Local Data
SUB_APPLE .FILL x3400
SUB_PEAR .FILL x3200


;=================================================
;Subroutine: SUB_OUTPUT_NUM_IN_16BIT_BINARY_3200
;Parameter (R2): The value to be converted
;Postcondition: This subroutine prints the integer value of R2 as a two's complement binary number
;Return value: none
;=================================================

.orig x3200
;Subroutine Instructions
ST R0, BACKUP_R0_3200
ST R2, BACKUP_R2_3200
ST R3, BACKUP_R3_3200
ST R4, BACKUP_R4_3200
ST R7, BACKUP_R7_3200


  LEA R0, PEACH
  PUTS

  LD R4, PINEAPPLE
  LD R3, MANGO
  LD R6, MASK

  WHILE_LOOP
    AND R5, R2, R6
    BRn B_ONE

    LD R0, zero
    OUT
    ADD R2, R2, R2
    ADD R4, R4, #-1
    ADD R3, R3, #-1
    BRz END_ACTION
      ADD R4, R4, #0
      BRp WHILE_LOOP
LD R0, SPACE
OUT
LD R4, PINEAPPLE
      BRnzp WHILE_LOOP

    B_ONE
      LD R0, one
      OUT
      ADD R2, R2, R2
      ADD R4, R4, #-1
      ADD R3, R3, #-1
      BRz END_ACTION
ADD R4, R4, #0
BRp WHILE_LOOP
  LD R0, SPACE
  OUT
  LD R4, PINEAPPLE
BRnzp WHILE_LOOP 

    END_ACTION
      LEA R0, NEWLINE
      PUTS

LD R0, BACKUP_R0_3200
LD R2, BACKUP_R2_3200
LD R3, BACKUP_R3_3200
LD R4, BACKUP_R4_3200
LD R7, BACKUP_R7_3200

RET

;Subroutine Data
BACKUP_R0_3200 .BLKW #1
BACKUP_R2_3200 .BLKW #1
BACKUP_R3_3200 .BLKW #1
BACKUP_R4_3200 .BLKW #1
BACKUP_R7_3200 .BLKW #1

PINEAPPLE .FILL #4
MANGO .FILL #16
MASK .FILL x8000
zero .FILL x30
one .FILL x31
SPACE .FILL x20

PEACH .STRINGZ "b"
NEWLINE .STRINGZ "\n"

;=================================================
;Subroutine: SUB_16BIT_BINARY_INPUT_3400
;Parameter: none
;Postcondition: This subroutine converts a binary number entered by the user into a decimal number
;Return value: The decimal number, in R2
;=================================================

.orig x3400
;Subroutine Instructions
ST R0, BACKUP_R0_3400
ST R1, BACKUP_R1_3400
ST R3, BACKUP_R3_3400
ST R4, BACKUP_R4_3400
ST R5, BACKUP_R5_3400
ST R7, BACKUP_R7_3400

LEA R0, PROMPT
PUTS
GETC
LD R1, PAPAYA
LD R2, TOTAL
WHILE_LOOP1
  LD R5, ONE
  GETC
  NOT R3, R0
  ADD R3, R3, #1
  ADD R4, R3, R5
  BRz ADD_TOTAL
  ADD R1, R1, #-1
  BRp WHILE_LOOP1

  BRnz END

  ADD_TOTAL
    LD R4, DEC1
    ADD R5, R1, #-1
    BRnz END1
    ADD_LOOP
      ADD R4, R4, R4
      ADD R5, R5, #-1
      BRp ADD_LOOP
    END_ADD_LOOP
    ADD R2, R2, R4
    ADD R1, R1, #-1
    BRp WHILE_LOOP1

    END
      ADD R2, R2, #1
      LD R0, BACKUP_R0_3400
      LD R1, BACKUP_R1_3400
      LD R3, BACKUP_R3_3400
      LD R4, BACKUP_R4_3400
      LD R5, BACKUP_R5_3400
      LD R7, BACKUP_R7_3400

      RET

    END1
      LD R0, BACKUP_R0_3400
      LD R1, BACKUP_R1_3400
      LD R3, BACKUP_R3_3400
      LD R4, BACKUP_R4_3400
      LD R5, BACKUP_R5_3400
      LD R7, BACKUP_R7_3400

      RET

;Subroutine Data
BACKUP_R0_3400 .BLKW #1
BACKUP_R1_3400 .BLKW #1
BACKUP_R3_3400 .BLKW #1
BACKUP_R4_3400 .BLKW #1
BACKUP_R5_3400 .BLKW #1
BACKUP_R7_3400 .BLKW #1
PROMPT .STRINGZ "Enter 'b' followed by the 16 bit binary number\n"
PAPAYA .FILL 16
TOTAL .FILL #0
DEC1 .FILL #1
ONE .FILL x31


.end
