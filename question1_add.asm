.model small
.386
.stack 100h
.data
    data dd 00000000h
    inputNum1 db 10,13, 'enter first number :$'
    inputNum2 db 10,13, 'enter second number :$'
    output db 10,13, 'sum : $'
.code
.startup
    mov ax, @data
    mov ds, ax

    ; printing message for first input
    lea dx, inputNum1
    mov ah, 09H
    int 21H

    mov cx, 8 ; initializing loop to run 8 times.
    actualInput1:
        shl ebx, 4
        mov ah, 01h
        int 21h

        sub al, 30h
        add bl, al
    loop actualInput1

    ; moving the input number into a variable data which we made in data section.
    mov data,ebx

    ; printing message for first input
    lea dx, inputNum2
    mov ah,09H
    int 21h

    mov cx, 8
    actualInput2:
        shl ebx, 4
        mov ah, 01h
        int 21h

        sub al, 30h
        add bl, al
    loop actualInput2

    ; printing output message.
    lea dx, output
    mov ah, 09H
    int 21h

    ; adding first input and second input.
    add ebx, data

    ; printing the result.
    mov cx, 8
    displayResult:
        rol ebx, 4
        mov dl, bl
        and dl, 0fh
        add dl, 30h

        mov ah,02h
        int 21h
    loop displayResult

.exit
end