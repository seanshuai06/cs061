me: Thomas Chin
; Email:  tchin006@ucr.edu
; 
; Lab: lab 3
; Lab section: 022
; TA: O'Neill
; 
;=================================================
;
.ORIG x3000
;-----------------
;Instruction
;----------------
  LEA R0, prompt
  PUTS

  LD R1, count
  LEA R2, ARRAY_1 

  DO_WHILE
    GETC
    STR R0, R2, #0
    ADD R2, R2, #1

    OUT

    ADD R1, R1, #-1
    BRp DO_WHILE
  
  HALT
;-----------------
;Local Data
;-----------------
  prompt.STRINGZ"Enter 10 characters: "
  count.FILL#10
  ARRAY_1    .BLKW#10

.end
