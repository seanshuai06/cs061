me: Thomas Chin

; Email: tchin006@ucr.edu

; 

; Assignment name: Assignment 4

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



;-------------------------------

;INSERT CODE STARTING FROM HERE 

;--------------------------------

RESET_PROGRAM





ADD R5, R5, #0

LD R1,COUNT

LD R2, MCOUNT



LD R0, introMessage  ;Output Intro Message

PUTS



GETC



BR CHECK

END_CHECK



ADD R4, R0, #0



ADD R0, R0, #-16;Determine if positive or negative

ADD R0, R0, #-16

ADD R0, R0, #-13



BRz isNeg



ADD R0, R0, #2

BRz add_pos



BR isPos





isPos

  LEA R0, RESET

  ADD R0, R4, #0

  OUT



  ADD R5, R0, #0



  ADD R5, R5, #-16

  ADD R5, R5, #-16

  ADD R5, R5, #-16



  ADD R1, R1, #-1



  RETURN1



  DO_WHILE_POS;;Loop, 5 nums max

    GETC

    OUT



    BR CHECK1

    END_CHECK1



    ADD R3, R0, #0;;If Enter is hit, escape loop

    ADD R3, R3, #-10

    BRz ENTER_OUT_POS



    ADD R0, R0, #-16

    ADD R0, R0, #-16

    ADD R0, R0, #-16



    ADD R6, R5, #0

    

    MULT_POS;;Multiply by 10

      ADD R5, R5, R6

      ADD R2, R2, #-1

      BRp MULT_POS

      

    ADD R5, R5, R0;;Add value to R5



    LD R2, MCOUNT

    ADD R1, R1, #-1

    BRp DO_WHILE_POS



    HALT



  ENTER_OUT_POS



  HALT





isNeg

  LEA R0, NEG

  PUTS



  DO_WHILE_NEG;;Loop, 5 nums

    GETC

    OUT



    BR CHECK2

    END_CHECK2



    ADD R3, R0, #0;;If Enter is hit, escape loop

    ADD R3, R3, #-10

    BRz ENTER_OUT_NEG



    ADD R0, R0, #-16

    ADD R0, R0, #-16

    ADD R0, R0, #-16



    ADD R6, R5, #0

    

    MULT_NEG ;;Multiply by 10

      ADD R5, R5, R6

      ADD R2, R2, #-1

      BRp MULT_NEG

      

    ADD R5, R5, R0;;Add value to R5



    LD R2, MCOUNT

    ADD R1, R1, #-1

    BRp DO_WHILE_NEG



    NOT R5, R5;;Two's complement

    ADD R5, R5, #1



    HALT

  

  ENTER_OUT_NEG



  NOT R5, R5;;Two's complement

  ADD R5, R5, #1



  HALT





add_pos

  LEA R0, POS

  PUTS

  BR RETURN1





CHECK

  ADD R7, R0, #0

  LD R6, MCOUNT



  ADD R6, R6, #15

  ADD R6, R6, #15

  ADD R6, R6, #15

  ADD R6, R6, #3



  NOT R6, R6

  ADD R6, R6, #1



  ADD R6, R7, R6

  BRp ERROR_STATE

  

  BR END_CHECK



CHECK1

  ADD R7, R0, #0

  LD R6, MCOUNT



  ADD R6, R6, #15

  ADD R6, R6, #15

  ADD R6, R6, #15

  ADD R6, R6, #3



  NOT R6, R6

  ADD R6, R6, #1



  ADD R6, R7, R6

  BRp ERROR_STATE

  

  BR END_CHECK1



CHECK2

  ADD R7, R0, #0

  LD R6, MCOUNT



  ADD R6, R6, #15

  ADD R6, R6, #15

  ADD R6, R6, #15

  ADD R6, R6, #3



  NOT R6, R6

  ADD R6, R6, #1



  ADD R6, R7, R6

  BRp ERROR_STATE

  

  BR END_CHECK2





ERROR_STATE

  LD R0, errorMessage  ;Output Error Message

  PUTS

  LD R0, NEWLINE

  PUTS

  BR RESET_PROGRAM

    



  

;---------------

;Data

;---------------

POS.STRINGZ"+"

NEG.STRINGZ"-"

NEWLINE.STRINGZ"\n"

COUNT.FILL#5

MCOUNT.FILL#9

RESET.FILL#0



introMessage .FILL x6000

errorMessage .FILL x6100



;------------

;Remote data

;------------

.ORIG x6000

;---------------

;messages

;---------------

intro .STRINGZ"Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

;---------------

;error_messages

;---------------

.ORIG x6100

error_mes .STRINGZ"\nERROR INVALID INPUT\n"



;---------------

;END of PROGRAM

;---------------

.END

;-------------------

;PURPOSE of PROGRAM

;-------------------
