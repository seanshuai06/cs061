me: Thomas Chin

; Email: tchin006@ucr.edu

; 

; Assignment name: Assignment 5

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



MAIN_LOOP



  LD R0, MENU;;Go to menu

  JSRR R0



  ADD R1, R1, #-1

  BRz CHOICE_ONE



  ADD R1, R1, #-1

  BRz CHOICE_TWO



  ADD R1, R1, #-1

  BRz CHOICE_THREE



  ADD R1, R1, #-1

  BRz CHOICE_FOUR



  ADD R1, R1, #-1

  BRz CHOICE_FIVE



  ADD R1, R1, #-1

  BRz CHOICE_SIX



  ADD R1, R1, #-1

  BRz CHOICE_SEVEN



CHOICE_ONE

  LD R1, ALL_MACHINES_BUSY;;Subroutine

  JSRR R1



  BR RET_MAIN



CHOICE_TWO

  LD R1, ALL_MACHINES_FREE;;Subroutine

  JSRR R1



  BR RET_MAIN



CHOICE_THREE  

  LD R1, NUM_BUSY_MACHINES;;Subroutine

  JSRR R1



  BR RET_MAIN



CHOICE_FOUR

  LD R1, NUM_FREE_MACHINES;;Subroutine

  JSRR R1



  BR RET_MAIN



CHOICE_FIVE

  LD R1, MACHINE_STATUS;;Subroutine

  JSRR R1



  BR RET_MAIN



CHOICE_SIX

  LD R1, FIRST_FREE;;Subroutine

  JSRR R1



  BR RET_MAIN



CHOICE_SEVEN

  LD R0, NEW_LINE

  OUT



  LEA R0, Goodbye

  PUTS

  HALT





RET_MAIN

  BR MAIN_LOOP

;---------------

;Data

;---------------

;Add address for subroutines

MENU.FILLx3200

ALL_MACHINES_BUSY.FILLx3400

ALL_MACHINES_FREE.FILLx3600

NUM_BUSY_MACHINES.FILL x3800

NUM_FREE_MACHINES.FILLx4000

MACHINE_STATUS.FILL x4200

FIRST_FREE.FILL x4400

NEW_LINE.FILL x0A



Goodbye .Stringz "Goodbye!\n"





;-----------------------------------------------------------------------------------------------------------------

; Subroutine: MENU

; Inputs: None

; Postcondition: The subroutine has printed out a menu with numerical options, allowed the

;                          user to select an option, and returned the selected option.

; Return Value (R1): The option selected:  #1, #2, #3, #4, #5, #6 or #7

; no other return value is possible

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine MENU

;--------------------------------

.orig x3200

SUB_MENU



ST R0,R0_BACKUP_3200

ST R7,R7_BACKUP_3200



LD R1, Menu_string_addr



MENU_LOOP

    LDR R0,R1,#0

    OUT

    ADD R1,R1,#1

    ADD R0,R0,#0

    BRnp MENU_LOOP



GETC

ADD R1,R0,#0



LD R0,ASCII_TONUM_3200

ADD R1,R1,R0



LD R0,R0_BACKUP_3200

LD R7,R7_BACKUP_3200



RET



;--------------------------------

;Data for subroutine MENU

;--------------------------------

Error_message_1 .STRINGZ "INVALID INPUT\n";;DO IT

ASCII_TONUM_3200 .FILL -x30

Menu_string_addr .FILL x6000

R0_BACKUP_3200 .BLKW #1

R7_BACKUP_3200 .BLKW #1





;-----------------------------------------------------------------------------------------------------------------

; Subroutine: ALL_MACHINES_BUSY

; Inputs: None

; Postcondition: The subroutine has returned a value indicating whether all machines are busy

; Return value (R2): 1 if all machines are busy,    0 otherwise

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine ALL_MACHINES_BUSY

;---------------------------------

.orig x3400



ST R0,R0_BACKUP_3400

ST R7,R7_BACKUP_3400



LD R0,BUSYNESS_ADDR_ALL_MACHINES_BUSY

LDR R0,R0,#0

BRz ISBUSY



LEA R0,ALLNOTBUSY

PUTS



AND R2,R2,#0

BR RET_BUSY



ISBUSY

  AND R2,R2,#0

  ADD R2,R2,#1 

  LEA R0,ALLBUSY

  PUTS



RET_BUSY





LD R0,R0_BACKUP_3400

LD R7,R7_BACKUP_3400



RET



;--------------------------------

;Data for subroutine ALL_MACHINES_BUSY

;--------------------------------



BUSYNESS_ADDR_ALL_MACHINES_BUSY .Fill xD000

ALLNOTBUSY .Stringz "Not all machines are busy\n"

ALLBUSY .Stringz "All machines are busy\n"



R0_BACKUP_3400 .BLKW #1

R7_BACKUP_3400 .BLKW #1



;-----------------------------------------------------------------------------------------------------------------

; Subroutine: ALL_MACHINES_FREE

; Inputs: None

; Postcondition: The subroutine has returned a value indicating whether all machines are free

; Return value (R2): 1 if all machines are free, 0 otherwise

;-----------------------------------------------------------------------------------------------------------------

;1 means free 0 means busy

.orig x3600

SUB_ALL_MACHINES_FREE



ST R0,R0_BACKUP_3600

ST R7,R7_BACKUP_3600



LD R0,BUSYNESS_ADDR_ALL_MACHINES_FREE

LDR R0,R0,#0

ADD R0,R0,#1

BRz ISFREE



LEA R0,NOTFREE

PUTS



AND R2,R2,#0

BR RET_FREE



ISFREE

  AND R2,R2,#0

  ADD R2,R2,#1 

  LEA R0,FREE

  PUTS





RET_FREE



LD R0,R0_BACKUP_3600

LD R7,R7_BACKUP_3600



RET



BUSYNESS_ADDR_ALL_MACHINES_FREE .Fill xD000

FREE .STRINGZ "All machines are free\n"

NOTFREE .STRINGZ "Not all machines are free\n"



R0_BACKUP_3600 .BLKW #1

R7_BACKUP_3600 .BLKW #1



;-----------------------------------------------------------------------------------------------------------------

; Subroutine: NUM_BUSY_MACHINES

; Inputs: None

; Postcondition: The subroutine has returned the number of busy machines.

; Return Value (R2): The number of machines that are busy

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine NUM_BUSY_MACHINES

;---------------------------------

.orig x3800

SUB_NUM_BUSY_MACHINES



ST R0,R0_BACKUP_3800

ST R5,R5_BACKUP_3800

ST R7,R7_BACKUP_3800



AND R5,R5,#0

ADD R5,R5,#1



LD R0,PTR_NUM_FREE_MACHINES

JSRR R0



AND R0,R0,#0

ADD R0,R0,#12

ADD R0,R0,#4



NOT R2,R2

ADD R2,R2,#1



ADD R2,R2,R0



ADD R6,R2,#0

LEA R0,BUSYMACHINE1

PUTS



LD R0,PRINT_NUM_ONE

JSRR R0



LEA R0,BUSYMACHINE2

PUTS





LD R0,R0_BACKUP_3800

LD R5,R5_BACKUP_3800

LD R7,R7_BACKUP_3800



RET



;--------------------------------

;Data for subroutine NUM_BUSY_MACHINES

;------------------------------



PTR_NUM_FREE_MACHINES.Fill x4000

BUSYMACHINE1 .STRINGZ "There are "

BUSYMACHINE2 .STRINGZ " busy machines\n"

PRINT_NUM_ONE .FILL x5400



R0_BACKUP_3800 .BLKW  #1

R5_BACKUP_3800 .BLKW  #1

R7_BACKUP_3800 .BLKW  #1



;-----------------------------------------------------------------------------------------------------------------

; Subroutine: NUM_FREE_MACHINES

; Inputs: None

; Postcondition: The subroutine has returned the number of free machines

; Return Value (R2): The number of machines that are free 

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine NUM_FREE_MACHINES

;--------------------------------

.orig x4000

SUB_NUM_FREE_MACHINES



ST R0,R0_BACKUP_4000

ST R1,R1_BACKUP_4000

ST R3,R3_BACKUP_4000

ST R4,R4_BACKUP_4000

ST R5,R5_BACKUP_4000

ST R7,R7_BACKUP_4000



LD R0,BUSYNESS_ADDR_NUM_FREE_MACHINES

LDR R0,R0,#0



AND R1,R1,#0

ADD R1,R1,#1



AND R2,R2,#0



AND R3,R3,#0

ADD R3,R3,#12

ADD R3,R3,#4



MATCH_LOOP

  AND R4,R0,R1

  BRz NOCOUNT

  ADD R2,R2,#1



  NOCOUNT

    ADD R1,R1,R1

    ADD R3,R3,#-1

    BRnp MATCH_LOOP

  

  ADD R6,R2,#0



ADD R5,R5,#-1

BRz SKIP



LEA R0,FREEMACHINE1

PUTS



LD R0,PRINT_NUM_TWO

JSRR R0



LEA R0,FREEMACHINE2

PUTS

SKIP



LD R0,R0_BACKUP_4000

LD R1,R1_BACKUP_4000

LD R3,R3_BACKUP_4000

LD R4,R4_BACKUP_4000

LD R5,R5_BACKUP_4000

LD R7,R7_BACKUP_4000

RET



;--------------------------------

;Data for subroutine NUM_FREE_MACHINES

;-------------------------------

R0_BACKUP_4000 .BLKW #1

R1_BACKUP_4000 .BLKW #1

R3_BACKUP_4000 .BLKW #1

R4_BACKUP_4000 .BLKW #1

R5_BACKUP_4000 .BLKW #1

R7_BACKUP_4000 .BLKW #1



BUSYNESS_ADDR_NUM_FREE_MACHINES .Fill xD000

PRINT_NUM_TWO .FILL x5400

FREEMACHINE1 .STRINGZ "There are "

FREEMACHINE2 .STRINGZ " free machines\n"





;-----------------------------------------------------------------------------------------------------------------

; Subroutine: MACHINE_STATUS

; Input (R1): Which machine to check

; Postcondition: The subroutine has returned a value indicating whether the machine indicated

;                          by (R1) is busy or not.

; Return Value (R2): 0 if machine (R1) is busy, 1 if it is free

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine MACHINE_STATUS

;--------------------------------

.orig x4200





ST R0,R0_BACKUP_4200

ST R1,R1_BACKUP_4200

ST R5,R5_BACKUP_4200

ST R7,R7_BACKUP_4200



LD R0,SUB_GET_INPUT

JSRR R0



ADD R6,R1,#0



LEA R0,STATUS1

PUTS



LD R0,PRINT_NUM_3

JSRR R0



LD R5,BIT_4200



SHIFT_LEFT

    ADD R1,R1,#0

    BRnz END_SHIFT_LEFT

   

    ADD R5,R5,R5



    ADD R1,R1,#-1

    BR SHIFT_LEFT



END_SHIFT_LEFT





LD R1,BUSYNESS_ADDR_MACHINE_STATUS

LDR R1,R1,#0

AND R1,R5,R1



BRnp IS_FREE_4200

BR IS_BUSY_4200



IS_FREE_4200

    AND R2,R2,#0

    ADD R2,R2,#1



    LEA R0,STATUS2

    PUTS



    BR END_4200



IS_BUSY_4200

    AND R2,R2,#0



    LEA R0,STATUS3

    PUTS



    BR END_4200





END_4200



LD R0,R0_BACKUP_4200

LD R1,R1_BACKUP_4200

LD R5,R5_BACKUP_4200

LD R7,R7_BACKUP_4200



RET





;--------------------------------

;Data for subroutine MACHINE_STATUS

;--------------------------------



BIT_4200 .FILL x0001

BUSYNESS_ADDR_MACHINE_STATUS.Fill xD000

SUB_GET_INPUT .FILL x5200

STATUS1 .STRINGZ "Machine "

STATUS2  .STRINGZ " is busy\n"

STATUS3 .STRINGZ " is free\n"

PRINT_NUM_3 .FILL x5400

R0_BACKUP_4200 .BLKW #1

R1_BACKUP_4200 .BLKW #1

R5_BACKUP_4200 .BLKW #1

R7_BACKUP_4200 .BLKW #1



;-----------------------------------------------------------------------------------------------------------------

; Subroutine: FIRST_FREE

; Inputs: None

; Postcondition: 

; The subroutine has returned a value indicating the lowest numbered free machine

; Return Value (R2): the number of the free machine

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine FIRST_FREE

;--------------------------------

.orig x4600

SUB_FIRST_FREE



ST R0,R0_BACKUP_4600

ST R1,R1_BACKUP_4600

ST R3,R3_BACKUP_4600

ST R4,R4_BACKUP_4600

ST R5,R5_BACKUP_4600

ST R7,R7_BACKUP_4600





AND R2,R2,#0



AND R1,R1,#0

ADD R1,R1,#12

ADD R1,R1,#4



LD R5,FIRST_BIT

LD R4,BUSYNESS_ADDR_FIRST_FREE

LDR R4,R4,#0





SHIFT_LEFT_4600

     AND R3,R4,R5

     BRnp END_SHIFT_LEFT_4600   



     ADD R5,R5,R5



     ADD R2,R2,#1

     ADD R1,R1,#-1

     BRz END_SHIFT_LEFT_4600



     BR SHIFT_LEFT_4600





END_SHIFT_LEFT_4600



ADD R1,R1,#0

BRnp PRINT_4600

 

LEA R0,FIRSTFREE3

PUTS



BR RET_FIRST



PRINT_4600

  LEA R0,FIRSTFREE

  PUTS



ADD R6,R2,#0

LD R0,PRINT_NUM_FOUR

JSRR R0



LEA R0,FIRSTFREE2

PUTS



RET_FIRST

  LD R0,R0_BACKUP_4600

  LD R1,R1_BACKUP_4600

  LD R3,R3_BACKUP_4600

  LD R4,R4_BACKUP_4600

  LD R5,R5_BACKUP_4600

  LD R7,R7_BACKUP_4600



RET



;--------------------------------

;Data for subroutine FIRST_FREE

;--------------------------------



FIRST_BIT .FILL x0001

BUSYNESS_ADDR_FIRST_FREE .Fill xD000

FIRSTFREE .STRINGZ "The first available machine is number "

FIRSTFREE2 .STRINGZ "\n"

FIRSTFREE3 .STRINGZ "No machines are free\n"

PRINT_NUM_FOUR .FILL x5400



R0_BACKUP_4600 .BLKW #1

R1_BACKUP_4600 .BLKW #1

R3_BACKUP_4600 .BLKW #1

R4_BACKUP_4600 .BLKW #1

R5_BACKUP_4600 .BLKW #1

R7_BACKUP_4600 .BLKW #1



;-----------------------------------------------------------------------------------------------------------------

; Subroutine: Get input

; Inputs: None

; Postcondition: 

; The subroutine get up to a 5 digit input from the user within the range [-32768,32767]

; Return Value (R1): The value of the contructed input

; NOTE: This subroutine should be the same as the one that you did in assignment 5

;to get input from the user, except the prompt is different.

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine 

;--------------------------------

.orig x5200



RESET_PROGRAM



ST R0, BACKUP_R0_5200

ST R2, BACKUP_R2_5200

ST R3, BACKUP_R3_5200

ST R4, BACKUP_R4_5200

ST R5, BACKUP_R5_5200

ST R6, BACKUP_R6_5200

ST R7, BACKUP_R7_5200





ADD R1, R1, #0

LD R5,COUNT

LD R2, MCOUNT



LEA R0, prompt  ;Output Intro Message

PUTS



GETC



BR CHECK

END_CHECK



ADD R4, R0, #0



ADD R0, R0, #-16;Determine if positive or negative

ADD R0, R0, #-16

ADD R0, R0, #-13



BRz isNeg_5200



ADD R0, R0, #2

BRz add_pos



BR isPos_5200





isPos_5200

  LEA R0, RESET

  ADD R0, R4, #0

  OUT



  ADD R1, R0, #0



  ADD R1, R1, #-16

  ADD R1, R1, #-16

  ADD R1, R1, #-16



  ADD R5, R5, #-1



  RETURN1



  DO_WHILE_POS;;Loop, 2 nums max

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



    ADD R6, R1, #0

    

    MULT_POS;;Multiply by 10

      ADD R1, R1, R6

      ADD R2, R2, #-1

      BRp MULT_POS

      

    ADD R1, R1, R0;;Add value to R5



    LD R2, MCOUNT

    ADD R5, R5, #-1

    BRp DO_WHILE_POS



    LD R0, NEWERLINE

    OUT



    BR RET_INPUT



  ENTER_OUT_POS



  BR RET_INPUT





isNeg_5200

  LEA R0, NEG

  PUTS



  DO_WHILE_NEG;;Loop, 2 nums

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



    ADD R6, R1, #0

    

    MULT_NEG ;;Multiply by 10

      ADD R1, R1, R6

      ADD R2, R2, #-1

      BRp MULT_NEG

      

    ADD R1, R1, R0;;Add value to R5



    LD R2, MCOUNT

    ADD R5, R5, #-1

    BRp DO_WHILE_NEG



    NOT R1, R1;;Two's complement

    ADD R1, R1, #1



    LD R0, NEWERLINE

    OUT



    BR RET_INPUT

  

  ENTER_OUT_NEG



  NOT R1, R1;;Two's complement

  ADD R1, R1, #1



  BR RET_INPUT





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

  LEA R0, Error_message_2  ;Output Error Message

  PUTS

  LD R0, NEWERLINE

  OUT

  BR RESET_PROGRAM



RET_INPUT

  LD R0, BACKUP_R0_5200

  LD R2, BACKUP_R2_5200

  LD R3, BACKUP_R3_5200

  LD R4, BACKUP_R4_5200

  LD R5, BACKUP_R5_5200

  LD R6, BACKUP_R6_5200

  LD R7, BACKUP_R7_5200



  RET

    



;--------------------------------

;Data for subroutine Get input

;--------------------------------

prompt .STRINGZ "Enter which machine you want the status of (0 - 15), followed by ENTER: "

Error_message_2 .STRINGZ "ERROR INVALID INPUT\n"



POS.STRINGZ"+"

NEG.STRINGZ"-"

NEWLINE_5200.STRINGZ"\n"

NEWERLINE.FILLx0A

COUNT.FILL#2

MCOUNT.FILL#9

RESET.FILL#0



BACKUP_R0_5200.BLKW 1

BACKUP_R2_5200.BLKW 1

BACKUP_R3_5200.BLKW 1

BACKUP_R4_5200.BLKW 1

BACKUP_R5_5200.BLKW 1

BACKUP_R6_5200.BLKW 1

BACKUP_R7_5200.BLKW 1





;-----------------------------------------------------------------------------------------------------------------

; Subroutine: print number

; Inputs: 

; Postcondition: 

; The subroutine prints the number that is in 

; Return Value : 

; NOTE: This subroutine should print the number to the user WITHOUT 

;leading 0's and DOES NOT output the '+' for positive numbers.

;-----------------------------------------------------------------------------------------------------------------

;-------------------------------

;INSERT CODE For Subroutine 

;--------------------------------

.orig x5400



ST R0,R0_BACKUP_5400

ST R1,R1_BACKUP_5400

ST R6,R6_BACKUP_5400

ST R2,R2_BACKUP_5400

ST R3,R3_BACKUP_5400

ST R4,R4_BACKUP_5400

ST R7,R7_BACKUP_5400



ADD R6,R6,#0

BRz ZERO_5400

BRn NEG_5400

BR ELSE_5400



ZERO_5400

    LD R4, CHAR_5400

    ADD R0,R6,R4

    OUT



    BR EXIT_5400_5





NEG_5400

    LD R0,MIN_5400

    OUT

    NOT R6,R6

    ADD R6,R6,#1





ELSE_5400



LD R0,DEC_10000_5400

AND R3,R3,#0



AND R1,R1,#0



DECR_10000_5400

    ADD R2,R6,#0

    ADD R2,R2,R0

    BRn DONE_10000_5400



    ADD R3,R3,#1

    ADD R6,R2,#0

    BR DECR_10000_5400





DONE_10000_5400

    LD R4, CHAR_5400

    ADD R0,R3,R4

    LD R5,NUM_5400

    ADD R5,R5,R0

    ADD R5,R5,R1



    BRz EXIT_5400_1

    ADD R1,R1,#1

    OUT



EXIT_5400_1



LD R0,DEC_1000_5400

AND R3,R3,#0





DECR_1000_5400

    ADD R2,R6,#0

    ADD R2,R2,R0

    BRn DONE_1000_5400



    ADD R3,R3,#1

    ADD R6,R2,#0

    BR DECR_1000_5400





DONE_1000_5400

    LD R4, CHAR_5400

    ADD R0,R3,R4

    LD R5, NUM_5400

    ADD R5,R5,R0

    ADD R5,R5,R1



    BRz EXIT_5400_2 

    ADD R1,R1,#1

    OUT



EXIT_5400_2





LD R0,DEC_100_5400

AND R3,R3,#0





DECR_100_5400

    ADD R2,R6,#0

    ADD R2,R2,R0

    BRn DONE_100_5400



    ADD R3,R3,#1

    ADD R6,R2,#0

    BR DECR_100_5400





DONE_100_5400

    LD R4, CHAR_5400

    ADD R0,R3,R4

    LD R5,NUM_5400

    ADD R5,R5,R0

    ADD R5,R5,R1

    BRz EXIT_5400_3



    ADD R1,R1,#1

    OUT





EXIT_5400_3

LD R0,DEC_10_5400

AND R3,R3,#0



DECR_10_5400

    ADD R2,R6,#0

    ADD R2,R2,R0

    BRn DONE_10_5400



    ADD R3,R3,#1

    ADD R6,R2,#0

    BR DECR_10_5400





DONE_10_5400

    LD R4, CHAR_5400

    ADD R0,R3,R4

    LD R5,NUM_5400

    ADD R5,R5,R0

    ADD R5,R5,R1



    BRz EXIT_5400_4

    ADD R1,R1,#1

    OUT



EXIT_5400_4





LD R0,DEC_1_5400

AND R3,R3,#0





DECR_1_5400

    ADD R2,R6,#0

    ADD R2,R2,R0

    BRn DONE_1_5400



    ADD R3,R3,#1

    ADD R6,R2,#0

    BR DECR_1_5400





DONE_1_5400

    LD R4, CHAR_5400

    ADD R0,R3,R4

    LD R5,NUM_5400

    ADD R5,R5,R0

    ADD R5,R5,R1

    BRz EXIT_5400_5



    ADD R1,R1,#1

    OUT





EXIT_5400_5



;restore

LD R0,R0_BACKUP_5400

LD R1,R1_BACKUP_5400

LD R6,R6_BACKUP_5400

LD R2,R2_BACKUP_5400

LD R3,R3_BACKUP_5400

LD R4,R4_BACKUP_5400

LD R7,R7_BACKUP_5400



RET



;--------------------------------

;Data for subroutine print number

;--------------------------------

R0_BACKUP_5400 .BLKW #1

R1_BACKUP_5400 .BLKW #1

R6_BACKUP_5400 .BLKW #1

R2_BACKUP_5400 .BLKW #1

R3_BACKUP_5400 .BLKW #1

R4_BACKUP_5400 .BLKW #1

R7_BACKUP_5400 .BLKW #1



CHAR_5400 .FILL x30

NUM_5400 .FILL -x30

MIN_5400 .FILL '-'

DEC_10000_5400 .FILL #-10000

DEC_1000_5400 .FILL #-1000

DEC_100_5400 .FILL #-100

DEC_10_5400 .FILL #-10

DEC_1_5400 .FILL #-1







.ORIG x6000

MENUSTRING .STRINGZ "**********************\n* The Busyness Server *\n**********************\n1. Check to see whether all machines are busy\n2. Check to see whether all machines are free\n3. Report the number of busy machines\n4. Report the number of free machines\n5. Report the status of machine n\n6. Report the number of the first available machine\n7. Quit\n"



.ORIG xD000; Remote data

BUSYNESS .FILL xABCD; <----!!!VALUE FOR BUSYNESS VECTOR!!!



;---------------

;END of PROGRAM

;---------------

.END
