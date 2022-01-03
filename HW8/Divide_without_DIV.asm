; By Parsa KamaliPour - 97149081

TITLE DIV-PROG (EXE) DIVIDE TWO NUMBER WITHOUT USING DIV & IDIV
PAGE 60, 132

.MODEL SMALL

.DATA

    ;X DB 010H
    ;Y DB 04H
    X DB 017H
    Y DB 05H
    REMAINDER DB ?
    QUOTIENT DB ?

.CODE

    MAIN:
        MOV AX, @DATA
        MOV DS, AX

        XOR AL, AL
        MOV AL, X
        ADD AL, Y
        XOR CL, CL

    L:
        SUB AL, Y
        INC CL
        CMP AL, Y
        JAE L
    
    ELSE:

        DEC CL
        MOV REMAINDER, AL
        MOV QUOTIENT, CL

    END:

        MOV AH, 4CH
        INT 21H

END MAIN

