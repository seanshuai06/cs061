me: Thomas Chin
; Email: tchin006@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 022
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team.
;
;=================================================

.ORIG x3000; Program begins here
;-------------
;Instructions
;-------------
LD R6, Convert_addr; R6 <-- Address pointer for Convert
LDR R1, R6, #0; R1 <-- VARIABLE Convert 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
LD R2, Count
LD R3, Count2

FOR_LOOP

  ADD R3, R3, #0
  ;;if(isPositive) {Print 0 or 1} else {print space}
  BRp SPACES
    LEA R0, SPACE
    PUTS
    LD R3, Count2
    ADD R2, R2, #0
    BR ENDSPACES
  
  SPACES
    ADD R1, R1, #0 ;;Trigger if
    ;;if(isNegative) {Print 0} else {print 1} 
    BRn IF
    ;;process positive 
    LEA R0, NUMZERO
    PUTS
    BR ENDIF

    IF
    ;;process negative
    LEA R0, NUMONE
    PUTS
    BR ENDIF

    ENDIF
      ADD R1, R1, R1
      ADD R3, R3, #-1
      ADD R2, R2, #-1
      BR ENDSPACES

  ENDSPACES
    BRp FOR_LOOP


LEA R0, NEWLINE
PUTS

HALT
;---------------
;Data
;---------------
Convert_addr .FILL xD000; The address of where to find the data
Count.FILL #16
Count2.FILL #4
NUMONE.STRINGZ "1"
NUMZERO.STRINGZ "0"
SPACE.STRINGZ " "
NEWLINE.STRINGZ "\n"

.ORIG xD000; Remote data
Convert .FILL xABCD; <----!!!NUMBER TO BE CONVERTED TO BINARY!!!
;---------------
;END of PROGRAM
;---------------
.END
