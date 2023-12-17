.model small
.stack 100h
.data
    inputMsg db 10,13, 'enter the Ascii character : $'
    outputMsg db 10,13, 'The binary of your Ascii character is : $'
.code
.startup
    mov ax, @data
    mov ds, ax

    ; printing input message
    lea dx, inputMsg
    mov ah, 09h
    int 21h

    ; taking user input
    mov ah, 01h
    int 21h

    mov bl, al
    ; printing output message.
    lea dx, outputMsg
    mov ah, 09h
    int 21h

    mov cx, 8
    outputLoop:
        shl bl, 1
        mov al, 0
        adc al, 30h
        mov dl, al

        mov ah, 02h
        int 21h
    loop outputLoop
.exit
end