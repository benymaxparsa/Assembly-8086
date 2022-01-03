; By Parsa KamaliPour - 97149081

TITLE MERGE-PROG (EXE) MERGE TWO SORTED ARRAYS INTO ONE SORTED ARRAY
PAGE 60, 132

.MODEL SMALL

.DATA

    ARRAY1 DB 1H,3H,5H,7H,9H,0BH,0DH,0FH,11H,13H
    ARRAY2 DB 2H,4H,6H,8H,0AH,0CH,0EH,10H,12H,14H
    FINAL DB 20 DUP(?)

.CODE

    MAIN:
        
        MOV AX, @DATA
        MOV DS, AX

        LEA DI, ARRAY1
        LEA SI, ARRAY2
        LEA BX, FINAL
        MOV CL, 10
        MOV CH, 10

    L1:

        CMP CH, 0
        JBE END_WITH_FIRST

        CMP CL, 0
        JBE END_WITH_SECOND

        MOV AL, [DI]
        CMP AL, [SI]
        JB FIRST
        JAE SECOND

    FIRST:

        MOV [BX], AL
        INC BX
        INC DI
        DEC CL
        JMP L1

    SECOND:

        MOV AH, [SI]
        MOV [BX], AH
        INC BX
        INC SI
        DEC CH
        JMP L1
    
    END_WITH_FIRST:

        CMP CL, 0
        JBE EXIT

        MOV AL, [DI]
        MOV [BX], AL
        INC BX
        INC DI
        DEC CL
        JMP END_WITH_FIRST

    END_WITH_SECOND:

        CMP CH, 0
        JBE EXIT

        MOV AH, [SI]
        MOV [BX], AH
        INC BX
        INC SI
        DEC CH
        JMP END_WITH_SECOND

    EXIT:

        MOV AH, 4CH
        INT 21H

END MAIN





        