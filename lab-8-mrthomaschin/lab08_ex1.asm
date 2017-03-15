me: Thomas Chin
; Email:  tchin006@ucr.edu
; 
; Lab: lab 8
; Lab section: 022
; TA: O'Neal
;=================================================
.ORIG x3000
;===========
;Instructions
;===========
LD R0, addr
LD R1, String

JSRR R1
PUTS

HALT
;=========
;Local Data Block
;=========
addr .FILL x4000
String .FILL x3200

;---------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING
; Parameter (R0): The address of where to start storing the string
; Postcondition: The subroutine has allowed the user to input a string,
; terminated by the [ENTER] key, and has stored it in an array
; that starts at (R0) and is NULL-terminated.
; Return Value: R5 The number of non-sentinel characters read from the user
;---------------------------------------------------------------------------
.ORIG x3200
;==========
;Subroutine Instructions
;==========

ST R0, BACKUP_R0_3200
ST R1, BACKUP_R1_3200
ST R7, BACKUP_R7_3200

LEA R0, PROMPT_3200
PUTS

LD R1, BACKUP_R0_3200
AND R5, R5, #0
LD R2, NEWLINE

NOT R2, R2
ADD R2, R2, #1

LOOP1
  GETC
  OUT
  ADD R3, R0, R2
  BRz RESET

  STR R0, R1, #0
  ADD R1, R1, #1
  ADD R5, R5, #1

  BRnzp LOOP1
END_LOOP1

  BRnzp LOOP1

RESET
  LD R0, ZERO
  STR R0, R1, #0

  LD R0, BACKUP_R0_3200
  LD R1, BACKUP_R1_3200
  LD R7, BACKUP_R7_3200
  RET

;========
;Subroutine Data
;========
PROMPT_3200.STRINGZ "Please enter some words (Press enter to finish upon completion: \n"
NEWLINE .FILLx0A
ZERO.FILL#0
BACKUP_R0_3200.BLKW x1
BACKUP_R1_3200.BLKW x1
BACKUP_R7_3200.BLKW x1

.END
