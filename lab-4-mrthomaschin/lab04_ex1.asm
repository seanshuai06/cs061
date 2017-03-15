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
;-----------------
  LD R1, DATA_PTR

  LDR R2, R1, #0
  ADD R2, R2, #1
  STR R2, R1, #0

  ADD R1, R1, #1

  LDR R3, R1, #0
  ADD R3, R3, #1
  STR R3, R1, #0
  
  HALT
;-----------------
;Local Data
;-----------------
  DATA_PTR .FILL    x4000

  .orig x4000
    .FILL #65
    .FILL x41

.end
