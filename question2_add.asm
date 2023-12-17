.model small
.stack 100h
.code
.startup
    mov bx , 1234h
    mov cx, 5678h

    add cl, bl
    mov al,cl
    daa

    mov dl, al
    adc ch, bh
    mov al, ch
    daa

    mov dh, al
    mov bx, dx

    mov cx, 4
    addLoop:
        rol bx, 4
        mov dl, bl
        and dl, 0fh
        add dl, 30h
        mov ah, 02h
        int 21h
    loop addLoop
.exit
end
