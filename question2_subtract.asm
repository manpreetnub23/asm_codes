.model small
.stack 100h
.code
.startup
    mov bx , 1234h
    mov cx, 5678h

    sub cl, bl
    mov al,cl
    das

    mov dl, al
    sbb ch, bh
    mov al, ch
    das

    mov dh, al
    mov bx, dx

    mov cx, 4
    subLoop:
        rol bx, 4
        mov dl, bl
        and dl, 0fh
        add dl, 30h
        mov ah, 02h
        int 21h
    loop subLoop
.exit
end
