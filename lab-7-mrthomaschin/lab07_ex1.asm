me: Thomas Chin
; Email: tchin006@ucr.edu
; 
; Lab: lab 7
; Lab section: 022
; TA: O'Neal
;=================================================
.orig x3000

LD R0, subInput
JSRR R0

ADD R5, R5, #1

LD R0, subOutput
JSRR R0

HALT

;Local Data
subInput .FILL x3200
subOutput .FILL x3400

;=================================================
;Subroutine: SUB_INPUT_MULTI_DIGIT_NUM_Data
;Parameter: None
;Postcondition: This subroutine returns a 5-digit number, entered by the user, in Register 5
;Return value: R5 (inputted number)
;=================================================

.orig x3200
;Subroutine Instructions
ST R0, BACKUP_R0_3200
ST R1, BACKUP_R1_3200
ST R2, BACKUP_R2_3200
ST R3, BACKUP_R3_3200
ST R4, BACKUP_R4_3200
ST R6, BACKUP_R6_3200
ST R7, BACKUP_R7_3200

RESET
  AND R5, R5, #0
  AND R6, R6, #0

  LD R0, introMessage
  PUTS

  LD R1, neg
  GETC

  OUT
  NOT R2, R0
  ADD R2, R2, #1
  ADD R2, R1, R2
  BRz FLAG

  LD R1, NEWLINE
  NOT R2, R0
  ADD R2, R2, #1
  ADD R2, R1, R2
  BRz ERROR

  LD R1, pos
  NOT R2, R0
  ADD R2, R2, #1
  LD R6, negOne
  ADD R2, R1, R2
  BRz DO_WHILE

  LD R1, zero
  NOT R2, R0
  ADD R2, R2, #1
  LD R3, count

  numLoop1
    ADD R4, R1, R2
    BRz ADDER
    ADD R1, R1, #1
    ADD R3, R3, #-1
    BRp numLoop1
  END_numLoop1

  BRnzp ERROR

  DO_WHILE
    GETC
    OUT

    LD R1, NEWLINE
    NOT R2, R0
    ADD R2, R2, #1
    ADD R2, R1, R2
    BRz END

    ADD R6, R6, #1
    LD R1, zero
    NOT R2, R0
    ADD R2, R2, #1
    LD R3, count

    numLoop2
      ADD R4, R1, R2
      BRz ADDER
      ADD R1, R1, #1
      ADD R3, R3, #-1
      BRp numLoop2
    END_numLoop2

    BRnzp ERROR

    ADDER
      LD R3, offset
      NOT R3, R3
      ADD R3, R3, #1
      ADD R0, R0, R3
      ST R5, mult_num
      LD R2, nine
      LD R3, mult_num
      WHILE
ADD R5, R5, R3
ADD R2, R2, #-1
BRp WHILE
      ADD R5, R5, R0
    END_ADDER
    BRnzp DO_WHILE
      
END
  ADD R6, R6, #0
  BRn ERROR
  LD R6, flagNum
  BRn two_comp
  LD R0, BACKUP_R0_3200
  LD R1, BACKUP_R1_3200
  LD R2, BACKUP_R2_3200
  LD R3, BACKUP_R3_3200
  LD R4, BACKUP_R4_3200
  LD R6, BACKUP_R6_3200
  LD R7, BACKUP_R7_3200

  RET

ERROR
  LD R0, NEWLINE
  OUT
  LD R0, errorMessage
  PUTS
  BRnzp RESET
END_ERROR

two_comp
  NOT R5, R5
  ADD R5, R5, #1
  LD R0, BACKUP_R0_3200
  LD R1, BACKUP_R1_3200
  LD R2, BACKUP_R2_3200
  LD R3, BACKUP_R3_3200
  LD R4, BACKUP_R4_3200
  LD R6, BACKUP_R6_3200
  LD R7, BACKUP_R7_3200

  RET

FLAG
  LD R6, negOne
  ST R6, flagNum
  LD R6, negOne
  BRnzp DO_WHILE
END_FLAG

;---------------
;Local Data
;---------------
offset .FILL #48
neg .FILL x2D
pos .FILL x2B
zero .FILL x30
count .FILL #10
NEWLINE .FILL x0A
negOne .FILL #-1
nine .FILL #9

flagNum .BLKW 1
mult_num .BLKW 1

introMessage .FILL x6000
errorMessage .FILL x6100
BACKUP_R0_3200 .BLKW 1
BACKUP_R1_3200 .BLKW 1
BACKUP_R2_3200 .BLKW 1
BACKUP_R3_3200 .BLKW 1
BACKUP_R4_3200 .BLKW 1
BACKUP_R6_3200 .BLKW 1
BACKUP_R7_3200 .BLKW 1


;=================================================
;Parameter (R5): Register with the value that will be outputted 
;Postcondition: This subroutine outputs a multidigit number loaded in R5
;Return value: None
;=================================================

.orig x3400
;Subroutine Instructions
ST R0, BACKUP_R0_3400
ST R1, BACKUP_R1_3400
ST R2, BACKUP_R2_3400
ST R3, BACKUP_R3_3400
ST R4, BACKUP_R4_3400
ST R5, BACKUP_R5_3400
ST R7, BACKUP_R7_3400

LD R2, DEC10000
NOT R2, R2
ADD R2, R2, #1
LD R3, NEG1
LD R4, offset3400
ST R5, currReg
AND R1, R5, #-1

BRzp LOOP_1
  LD R0, neg3400
  OUT
  NOT R5, R5
  ADD R5, R5, #1
  ST R5, currReg

LOOP_1
  ADD R3, R3, #1
  ADD R5, R5, R2
  BRzp LOOP_1

  ADD R0, R3, R4
  OUT

  ADD R3, R3, #-1

  LD R5, currReg
  ADD R3, R3, #0
  BRn END_WHILE_1

  WHILE_1
    ADD R5, R5, R2
    ADD R3, R3, #-1
    BRzp WHILE_1
  END_WHILE_1

  ST R5, currReg
  LD R2, DEC1000
  NOT R2, R2
  ADD R2, R2, #1    
  LD R3, NEG1

LOOP_2
  ADD R3, R3, #1
  ADD R5, R5, R2
  BRzp LOOP_2  

  ADD R0, R3, R4
  OUT

  LD R5, currReg
  ADD R3, R3, #0
  BRz END_WHILE_2

  WHILE_2
    ADD R5, R5, R2
    ADD R3, R3, #-1
    BRp WHILE_2

  END_WHILE_2
  ST R5, currReg
  LD R2, DEC100

  NOT R2, R2
  ADD R2, R2, #1

  LD R3, NEG1

LOOP_3
  ADD R3, R3, #1
  ADD R5, R5, R2
  BRzp LOOP_3  

  ADD R0, R3, R4
  OUT

  LD R5, currReg
  ADD R3, R3, #0
  BRz END_WHILE_3

  WHILE_3
    ADD R5, R5, R2
    ADD R3, R3, #-1
    BRp WHILE_3

  ST R5, currReg
  END_WHILE_3

  LD R2, DEC10

  NOT R2, R2
  ADD R2, R2, #1

  LD R3, NEG1

LOOP_4
  ADD R3, R3, #1
  ADD R5, R5, R2
  BRzp LOOP_4  

  ADD R0, R3, R4
  OUT

  LD R5, currReg
  ADD R3, R3, #0
  BRz END_WHILE_4

  WHILE_4
    ADD R5, R5, R2
    ADD R3, R3, #-1
    BRp WHILE_4

  ST R5, currReg
  END_WHILE_4

  LD R2, DEC1

  NOT R2, R2
  ADD R2, R2, #1

  LD R3, NEG1

LOOP_5
  ADD R3, R3, #1
  ADD R5, R5, R2
  BRzp LOOP_5  

  ADD R0, R3, R4
  OUT

  LEA R0, NEWLINE3400
  PUTS
  
LD R0, BACKUP_R0_3400
LD R1, BACKUP_R1_3400
LD R2, BACKUP_R2_3400
LD R3, BACKUP_R3_3400
LD R4, BACKUP_R4_3400
LD R5, BACKUP_R5_3400
LD R7, BACKUP_R7_3400

RET
;---------------
;SUB_OUTPUT_MULTI_DIGIT_NUM_Data
;---------------
offset3400 .FILL #48
neg3400 .FILL x2D
pos3400 .FILL x2B
zero3400 .FILL x30
DEC10000 .FILL #10000
DEC1000 .FILL #1000
DEC100 .FILL #100
DEC10 .FILL #10
DEC1 .FILL #1
NEG1 .FILL #-1
NEWLINE3400 .FILL x0A

currReg.BLKW 1

BACKUP_R0_3400 .BLKW 1
BACKUP_R1_3400 .BLKW 1
BACKUP_R2_3400 .BLKW 1
BACKUP_R3_3400 .BLKW 1
BACKUP_R4_3400 .BLKW 1
BACKUP_R5_3400 .BLKW 1
BACKUP_R7_3400 .BLKW 1
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
error_mes .STRINGZ"ERROR INVALID INPUT\n"

.end
