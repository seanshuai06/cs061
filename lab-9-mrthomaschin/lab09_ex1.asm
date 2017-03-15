me:  Thomas Chin
; Email: tchin006@ucr.edu
; 
; Lab: lab 9
; Lab section: 022
; TA: O'Neal
;=================================================
.orig x3000

LD R2, NEWLINE

NOT R2, R2
ADD R2, R2, #1

LD R4, BASE
LD R5, MAX
LD R6, TOS

WHILE_LOOP
  LEA R0, PROMPT
  PUTS

  GETC
  OUT

  ADD R3, R0, R2
  BRz END_LOOP

  ST R0, USER_INPUT
  LD R0, NEWLINE
  OUT

  LD R0, USER_INPUT
  LD R1, OFFSET
  ADD R0, R0, R1
  LD R1, SUB_STACK_PUSH
  JSRR R1
  BRnzp WHILE_LOOP

END_LOOP
  HALT

;Local Data
SUB_STACK_PUSH.FILL x3200
OFFSET .FILL #-48
NEWLINE .FILL x0A
BASE .FILL xA000
MAX .FILL xA005
TOS .FILL xA000

PROMPT .STRINGZ "Enter value to push onto stack\n"

USER_INPUT .BLKW 1


;------------------------------------------------------------------------------------------
;Subroutine: SUB_STACK_PUSH
; Parameter (R0): The value to push onto the stack
; Parameter (R4): BASE: A pointer to the base (one less than the lowest available
; address) of the stack
; Parameter (R5): MAX: The "highest" available address in the stack
; Parameter (R6): TOS (Top of Stack): A pointer to the current top of the stack
; Postcondition: The subroutine has pushed (R0) onto the stack (i.e to address TOS+1).
;  If the stack was already full (TOS = MAX), the subroutine has printed an
;  overflow error message and terminated.
; Return Value: R6  updated TOS
;------------------------------------------------------------------------------------------
.orig x3200
;Subroutine Instructions

ST R2, BACKUP_R2
ST R7, BACKUP_R7

NOT R2, R5
ADD R2, R2, #1

ADD R2, R6, R2
BRzp OVERFLOW_ERROR

ADD R6, R6, #1
STR R0, R6, #0

LD R2, BACKUP_R2
LD R7, BACKUP_R7

RET

OVERFLOW_ERROR
  ST R0, R0_ERROR
  LEA R0, OVERFLOW_MESSAGE
  PUTS

  LD R0, R0_ERROR
  LD R2, BACKUP_R2
  LD R7, BACKUP_R7

  RET

;Subroutine Data
OVERFLOW_MESSAGE .STRINGZ "Error Overflow!!\n"

BACKUP_R2 .BLKW 1
BACKUP_R7 .BLKW 1
R0_ERROR .BLKW 1
