.model small
.data
size db (?)     `;declare the size of the array
arr1 db 10 DUP(?)       ;declare 1st array
arr2 db 10 DUP(?)       ;declare 2nd array
m1 db 10,13,'Enter the size of the array: $'
e1 db 10,13,'Enter the elements of the array1: $'
e2 db 10,13,'Enter the elements of the array2: $'
m2 db 10,13,'Sum of the two arrays: $'

.code
.startup

MOV DX, OFFSET m1
MOV AH, 09H
INT 21H

MOV AH, 01H
INT 21H
SUB AL, 30H
MOV size, AL

MOV DX, OFFSET e1
MOV AH, 09H 
INT 21H
MOV SI, 0 
MOV CL, size

READ1:                                   ;to read the content of the first array
        MOV AH, 01H 
        INT 21H
        SUB AL, 30H 
        MOV arr1[SI], AL
        INC SI 
        
        MOV DL, 20H ;for Space
        MOV AH, 02H 
        INT 21H
        LOOP READ1
        
MOV DX, OFFSET e2
MOV AH, 09H
INT 21H
MOV SI, 0 
MOV CL, size

READ2:                                        ;to read the content of the second array
        MOV AH, 01H
        INT 21H
        SUB AL, 30H 
        MOV arr2[SI], AL 
        INC SI 
        
        MOV DL, 20H ; for space
        MOV AH, 02H 
        INT 21H
        LOOP READ2 
        
MOV DX, OFFSET m2
MOV AH, 09H 
INT 21H
MOV SI, 0 
MOV CL, size

ADD_ARRAYS:
             MOV AL, arr1[SI] 
             MOV BL, arr2[SI] 
             INC SI 
             ADD AL, BL 
             MOV AH, 00H 
             AAA 
             ADD AH, 30H
             ADD AL, 30H 
             MOV BH, AH 
             MOV BL, AL 
             MOV DL, BH 
             MOV AH, 02H 
             INT 21H
             MOV DL, BL 
             MOV AH, 02H 
             INT 21H
             MOV DL, 20H ;for Space
             MOV AH, 02H
             INT 21H
             LOOP ADD_ARRAYS 
.EXIT
END
