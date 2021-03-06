me: Thomas Chin
; Email:  tchin006@ucr.edu
; 
; Lab: lab 5
; Lab section: 022
; TA: O'Neill
; 5;=================================================

.orig x3000
;=========================================
;Instruction
;=========================================
 LDI R3, ARRAY_1
 LD R1, LOOP
 LD R2, COUNT

  LOOP_1
    GETC
    STR R2, R3, #0
    ADD R2, R2, #1
    ADD R3, R3, #1
    ADD R1, R1, #-1
    BRp LOOP_1

 LD R1, FIND
 ADD R3, R3, #-10
 LOOP_2
    ADD R1, R1, #0
    BRn ELSE
       ADD R1, R1, #-1
       ADD R3, R3, #1
       BR ENDIF
    ELSE
       STR R2, R3, #0    
       BR ENDIF
    ENDIF
       ADD R1, R1, #0
       BRp LOOP_2


 LD R1, LOOP
 ADD R3, R3, #-10
 LOOP_3
    STR R0, R3, #0
    OUT
    ADD R3, R3, #1
    ADD R1, R1, #-1
    BRp LOOP_3
  




;========================================
;Stored Data
;========================================
COUNT       .FILL     #0
LOOP        .FILL     #10
FIND    .FILL     #6

.orig x4000
ARRAY_1     .BLKW     #10
