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
  LDI R3, DEC_65_PTR
  LDI R4, HEX_41_PTR

  ADD R3, R3, #1
  ADD R4, R4, #1

  STI R3, DEC_65_PTR
  STI R4, HEX_41_PTR
  
  HALT

;-----------------
;Local Data
;-----------------
  DEC_65_PTR .FILL    x4000
  HEX_41_PTR .FILL    x4001

  .orig x4000
    .FILL #65
    .FILL x41

.end
