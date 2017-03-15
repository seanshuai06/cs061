me: Thomas Chin
; Email: tchin006@ucr.edu
; 
; Assignment name: Assignment 2
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

;----------------------------------------------
;outputs prompt
;----------------------------------------------
LEA R0, intro; 
PUTS; Invokes BIOS routine to output string

;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------
;------input--------
  LEA R0, NEWLINE
  PUTS

  Trap x20
  Trap x21
  ADD R1, R0, #0

  LEA R0, NEWLINE
  PUTS

  Trap x20
  Trap x21
  ADD R2, R0, #0

  LEA R0, NEWLINE
  PUTS

    ;;Output original numbers
  ADD R0, R1, #0
  Trap x21

  LEA R0, dash
  PUTS

  ADD R0, R2, #0
  Trap x21

  LEA R0, equal
  PUTS

    ;;Two's complement, to switch 2nd number to negative
  ADD R3, R2, #0
  NOT R3, R3
  ADD R3, R3, 1
    
    ;;Store value into register
  ADD R4, R1, R3
    ;; if(n < 0) {IS_NEGATIVE) else {continue)
  BRn IS_NEGATIVE
    ;;Convert number from ASKII to decimal
  ADD R4, R4, #15
  ADD R4, R4, #15
  ADD R4, R4, #15
  ADD R4, R4, #3
  
    ;;Print
  ADD R0, R4, #0
  Trap x21
  LEA R0, NEWLINE
  PUTS

  HALT

IS_NEGATIVE
    ;;2's complement again, bring negative value back to positive
  NOT R4, R4
  ADD R4, R4, #1
    ;;Convert number from ASKII to Decimal
  ADD R4, R4, #15
  ADD R4, R4, #15
  ADD R4, R4, #15
  ADD R4, R4, #3
    ;;Print, but print negative symbol in front
  LEA R0, negative
  PUTS
  ADD R0, R4, #0
  Trap x21
  LEA R0, NEWLINE
  PUTS

  HALT

;------
;Data
;------
; String to explain what to input 
intro .STRINGZ"ENTER two numbers (i.e '0'....'9')\n" 
NEWLINE .STRINGZ "\n"; String that holds the newline character
equal .STRINGZ " = "
dash .STRINGZ " - "
negative .STRINGZ "-"


;---------------
;END of PROGRAM
;---------------
.END

