me: Thomas Chin
; Email:  tchin006@ucr.edu
; 
; Lab: lab 6
; Lab section: 022
; TA: O'Neill
;=================================================
.orig x3000

LD R1, ONE
LD R3, SIZE
LD R2, ADDRESS

DO_WHILE_LOOP
  STR R1, R2, #0
  ADD R1, R1, R1
  ADD R2, R2, #1
  ADD R3, R3, #-1
  BRp DO_WHILE_LOOP
END_DO_WHILE_LOOP

LD R1, SUB_ADDR

LOOP
  LDR R2, R1, #0
  LD R5, SUB_ADDR
  JSRR R5
  ADD R1, R1, #1
  LD R0, SIZE
  ADD R0, R0, #-1
  ST R0, SIZE
  BRp LOOP
HALT


;Local Data;
ONE .FILL #1
ASCII_OFFSET .FILL #48
SIZE .FILL #10
COUNT .FILL #10
ADDRESS .FILL x4000
NEWLINE.STRINGZ "\n"
SUB_ADDR .FILL x3200

;=================================================
;INSTRUCTION
;=================================================

.orig x3200

ST R0, BACKUP_R0_3200
ST R2, BACKUP_R2_3200
ST R3, BACKUP_R3_3200
ST R4, BACKUP_R4_3200
ST R7, BACKUP_R7_3200


  LEA R0, BLETTER
  PUTS

  LD R4, FOUR
  LD R3, COUNTER
  LD R6, MASK

  WHILE_LOOP
    AND R5, R2, R6
    BRn IS_NEG
      LD R0, zero
      OUT
      ADD R2, R2, R2
      ADD R4, R4, #-1
      ADD R3, R3, #-1
      BRz END
      ADD R4, R4, #0
      BRp WHILE_LOOP
LD R0, SPACE
OUT
LD R4, FOUR
      BRnzp WHILE_LOOP

  IS_NEG
    LD R0, one
    OUT
    ADD R2, R2, R2
    ADD R4, R4, #-1
    ADD R3, R3, #-1
    BRz END
      ADD R4, R4, #0
      BRp WHILE_LOOP
LD R0, SPACE
OUT
LD R4, FOUR
      BRnzp WHILE_LOOP 

  END
    LEA R0, NEWLINER
    PUTS

LD R0, BACKUP_R0_3200
LD R2, BACKUP_R2_3200
LD R3, BACKUP_R3_3200
LD R4, BACKUP_R4_3200
LD R7, BACKUP_R7_3200

RET

;=================================
;DATA
;================================
BACKUP_R0_3200 .BLKW #1
BACKUP_R2_3200 .BLKW #1
BACKUP_R3_3200 .BLKW #1
BACKUP_R4_3200 .BLKW #1
BACKUP_R7_3200 .BLKW #1

BLETTER .STRINGZ "b"
FOUR .FILL #4
COUNTER .FILL #16
MASK .FILL x8000
zero .FILL x30
one .FILL x31
SPACE .FILL x20
NEWLINER .STRINGZ "\n"


x4000 ;Array of 10 integers
ARRAY .BLKW 10
.end
