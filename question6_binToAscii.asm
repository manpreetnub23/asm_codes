.model small
.stack 100h
.data
    inputMsg db 10,13,'enter the binary number ( 8 bits ) : $'
    outputMsg db, 10,13,'the Ascii value is : $'
.code
.startup
    mov ax, @data
    mov ds, ax

    ; printing input message.
    lea dx, inputMsg 
    mov ah, 09H
    int 21h

    mov cx, 8
    ; taking user input.
    inputLoop:
        mov ah, 01h
        int 21h

        sub al, 30h
        shl bl, 1
        add bl, al
    loop inputLoop

    ; printing output message.
    lea dx, outputMsg
    mov ah, 09H
    int 21h

    mov dl, bl
    mov ah, 02h
    int 21h
.exit
end