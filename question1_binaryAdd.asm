.model small
.386
.stack 100h
.data
temp dd 0h
carry dd 0h
sum dd 0h
temp1 dd 0h
temp2 dd 0h
msg1 db 10,13,'Enter first number : $'
msg2 db 10,13,'Enter second number : $'
res db 10,13,'Result of sum : $'

.code
.startup
mov dx, offset msg1
mov ah, 09h
int 21h 
mov ebx, 0h
mov cx, 20h
f:
    shl ebx, 1
    mov ah, 01h
    int 21h
    sub al, 30h
    add bl, al
loop f
mov dx, offset msg2
mov ah, 09h
int 21h
mov temp, ebx
mov ebx, 0h
mov cx, 20h
s:
    shl ebx, 1
    mov ah, 01h
    int 21h
    sub al, 30h
    add bl, al
loop s
;  mov ebx, 0FFFFFFFFh
;  mov temp, 0FFFFFFFFh
mov dx, offset res
mov ah, 09h
int 21h
mov cx, 20h
addition:
    mov eax, sum
    shl eax, 1
    mov sum, eax
    mov temp1, ebx
    and ebx, 01h
    mov edx, temp
    mov eax, temp
    and eax, 01h
    add eax, ebx
    add eax, carry
    cmp al, 02h
    jl zop
    je zp
    jg op
    zop:
        mov carry, 0h
        add sum, eax
    jmp shift
    zp:
        mov carry, 01h
        add sum, 0h
    jmp shift
    op:
        mov carry, 01h
        add sum, 01h
    shift:
        mov ebx, temp1
        shr ebx, 1
        shr edx, 1
        mov temp, edx
loop addition

mov edx, carry
add dl, 30h
mov ah, 02h
int 21h
mov ebx, sum
mov cx, 20h
o:
    mov temp1, ebx
    and ebx, 01h
    mov edx, ebx
    add dl, 30h
    mov ah, 02h
    int 21h
    mov ebx, temp1
    shr ebx, 1
loop o

mov ah, 4ch
int 21h
end