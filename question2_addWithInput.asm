.model small
.386
.data
DATA1 dw 0000H
msg db 10,13,"Enter the first number.:$"
msg1 db 10,13,"Enter the second number.:$"
msg2 db 10,13,"the result is:$"
.code
.startup
mov ah,09
mov dx,offset msg
int 21h

mov bx,0
mov cx,4        ;loop works 4 time
AGAIN:
mov ah,01  ;enter 1 number
int 21h
cmp al,'A'    ;compare with letter
jge l2
sub al,30h           ;48 ka hexadecimal 30 hota hai
;l2: sub al,37h
shl bx,4
add bl,al
loop AGAIN
mov DATA1,bx
mov ah,09
mov dx, offset msg1
int 21h

mov bx,0
mov cx,4
AGAIN1:
mov ah,01  ;2nd number entered
int 21h
cmp al,'A'
JGE l2
sub al,30h
;l3: sub al,37h
shl bx,4
add bl,al
loop AGAIN1
mov ax,DATA1
mov cx,0
add al,bl
daa
mov bl,al
adc ah,bh
mov al,ah
daa
mov bh,al
mov ah,09
mov dx,offset msg2
int 21h

mov dx,0
mov cx,4
AGAIN2: 
rol bx,4
mov dl,bl
and dl,0fh
add dl,30h
mov ah,02
int 21h
LOOP AGAIN2
l2: .EXIT
END

