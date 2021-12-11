page    60, 132
title   PROG2-1 (EXE) PURPOSE: ADDS 5 BYTES OF DATA

;---------------------------------- stack segment

stseg   segment
        DB 32 dup (?)
stseg   ends

;---------------------------------- data segment

dtseg   segment
data_in DB 25h, 12h, 15h, 1fh, 2bh
sum db ?
dtseg   ends

;---------------------------------- code segment

cdseg   segment
main    proc far
        assume cs:cdseg, ds:dtseg, ss:stseg
        mov ax, dtseg
        mov ds, ax

        mov cx, 05 ; loop counter CX=5
        mov bx, offset data_in ; data pointer
        mov al, 0 ; reset al

again:  add al, [bx] ; add new entry to al
        inc bx ; point to next data
        dec cx ; decrease loop counter
        jnz again ; jump if cx != 0
        mov sum, al ; load result in sum

        mov ah, 4ch
        int 21h

main    endp
cdseg   ends
        end main

