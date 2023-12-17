.model small
.stack 100h
.data 
msg1 db 10,13,"Enter size of array$"
msg2 db 10,13,"Enter element $"
msg3 db 10,13,"Enter element to search$"
msg4 db 10,13,"Element found$"
msg5 db 10,13,"Element not found$"
array db 5 dup(?)
sizee dw ?
sear db ?
.code
.startup
mov dx, offset msg1
mov ah,09h
int 21h
mov ah,01h
int 21h
mov ah,0
sub ax,30h
mov sizee,ax

mov cx,sizee
lea si,array

input:
    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov [si],al
    inc si
loop input


mov cx,sizee
lea si,array
print:
    mov dl,[si]
    add dl,30h
    ; mov dh,0
    mov ah,02h
    int 21h
    inc si
loop print

mov dx,offset msg3
mov ah,09h
int 21h
mov ah,01h
int 21h
sub al,30h
mov sear,al

mov cx,sizee
lea si,array
finding:
    mov ah,sear
    cmp [si],ah
    je find
    inc si
loop finding

mov dx,offset msg5
mov ah,09h
int 21h
jmp exit 

find:
    mov dx,offset msg4
    mov ah,09h
    int 21h

exit:
    .exit   
    end
