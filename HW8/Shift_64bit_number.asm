TITLE SHIFT-PROG (EXE) SHIFT A 64 BIT NUMBER TO THE RIGHT TWICE
PAGE 60, 132

.MODEL SMALL

.DATA

    NUMBER1 DD 78AFB39CH
    NUMBER2 DD 12341563H
    ORGINAL1 DD 78AFB39CH
    ORGINAL2 DD 12341563H

.CODE

    MAIN:

        MOV AX, @DATA
        MOV DS, AX

        LEA BX, NUMBER1
        LEA SI, NUMBER2
        CLC
        MOV DL, 2
        
    SHIFT:

        CMP DL, 0
        JBE EXIT

        RCR WORD PTR [SI + 2], 1
        RCR WORD PTR [SI], 1
        RCR WORD PTR [BX + 2], 1
        RCR WORD PTR [BX], 1
        DEC DL

        JMP SHIFT                    

    EXIT:

        MOV AH, 4CH
        INT 21H
        
END MAIN
