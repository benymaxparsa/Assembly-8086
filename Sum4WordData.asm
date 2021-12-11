TITLE   prog2-2 (EXE) PURPOSE: ADDS 4 WORDS OF DATA
PAGE    60, 132

; ----------------- stack seg

STSEG  SEGMENT
        DB 32 DUP (?)
STSEG   ENDS                 

; ----------------- data seg

DTSEG   SEGMENT
     
     DATA_IN    DW 234DH, 1DE6H, 3BC7H, 566AH
     ORG 10H
     SUM    DW ?
     
DTSEG ENDS

; ----------------- CODE SEG

CDSEG SEGMENT
    
    MAIN    PROC FAR
        
        ASSUME CS:CDSEG, DS:DTSEG, SS:STSEG
        MOV AX, DTSEG
        MOV DS, AX
        
        MOV CX, 04 ; LOOP COUNTER CX = 4
        MOV DI, OFFSET DATA_IN ; DATA POINTER
        MOV BX, 00 ; CLEAR BX
        
        ADD_LP:
        ADD BX, [DI] ;ADD POINTER CONTENTS IN BX
        INC DI
        INC DI ; POINT TO NEXT WORD
        DEC CX ; DECREMENT LOOP COUNTER
        JNZ ADD_LP ; JUMP IF CX != 0
        
        MOV SI, OFFSET SUM ; POINTER TO SUM
        MOV [SI], BX ; WRITE SUM IN MEMORY
        
        MOV AH, 4CH
        INT 21H 
        
    MAIN    ENDP
    
CDSEG ENDS
        
        END MAIN