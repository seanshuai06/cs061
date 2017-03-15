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

  LD R0, HEX_61

  LD R1, HEX_1A

  BRp LOOP

  HALT



  LOOP

    TRAP x21

    ADD R0, R0, #1

    ADD R1, R1, #-1

    BRp LOOP



;-----------------

;Local Data

;-----------------

  HEX_61 .FILL    x61

  HEX_1A .FILL    x1A



  .orig x4000

    .FILL #65

    .FILL x41



.end
