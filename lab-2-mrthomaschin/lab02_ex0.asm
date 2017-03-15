me: Thomas Chin
; Email:  tchin006@ucr.edu
; 
; Lab: lab 2
; Lab section: 022
; TA: O'Neill
; 
;=================================================
;
;Hello world example program
;Also illustrates how to use PUTS (aka: Trap x22)
;
.ORIG x3000
;===========
;Instructions
;===========
  LEA R0, MSG_TO_PRINT;R0 <--the location of the label: MSG_TO_PRINT
  PUTS;Prints string defined at MSG_TO_PRINT

  HALT;terminates program
;===========
;Local Data
;===========
  MSG_TO_PRINT.STRINGZ"Hello world!!!\n";store 'H' in an address labeled
;MSG_TO_PRINT and then each character
;('e', 'l', 'l', 'o',...) in it's own consectuive
;memory address, followed by #0 att hte end of the
;string to mark the end of the string
.END
