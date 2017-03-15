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

  LEA R2, ARRAY_1 
  LD R1, LOOP

  DO_WHILE
    GETC
    STR R0, R2, #0
    ADD R2, R2, #1
    ;Out
    ADD R1, R1, #-1
    BRp DO_WHILE
  END_DO_WHILE

  LEA R3, ARRAY_1
  LD R1, LOOP


  DO_WHILE_2
    LDR R0, R3, #1
    OUT    
    LEA R0, NEWLINE
    PUTS    
    ADD R3, R3, #1
    ADD R1, R1, #-1
    BRp DO_WHILE_2
  END_DO_WHILE_2
  
  HALT
;-----------------
;Local Data
;-----------------
  prompt.STRINGZ"Enter 10 characters: "
  LOOP.FILL#10
  ARRAY_1    .BLKW#10
  NEWLINE .STRINGZ"\n"

.END
