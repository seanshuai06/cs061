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
  LD R3, DEC_65
  LD R4, HEX_41

;-----------------
;Local Data
;-----------------
  DEC_65 .FILL #65
  HEX_41 .FILL x41

.end
