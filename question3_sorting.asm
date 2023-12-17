.model large
.stack 100h

.data
arr db 20 dup(?)
msg1 db 10,13,'Enter size: $'
msg2 db 10,13,'Enter elements: $'
res db 10, 13,'Sorted array: $'
dat dw 0000h
i dw 00h
j dw 00h

.code
.startup
mov ax, @data
mov ds,  ax
mov dx, offset msg1
mov ah, 09h
int 21h

mov ah, 01h
int 21h
sub al, 30h
mov ah, 00h
mov cx, ax
mov dat, ax
mov dx, offset msg2
mov ah, 09h
int 21h
mov bx, offset arr
mov si, 0

inarr:
	mov dl, ' '
	mov ah, 02h
	int 21h
	mov dx, si
	mov ah, 01h
	int 21h
	sub al, 30h
	mov si, dx
	mov [bx + si], al
	inc si
loop inarr

mov cx, dat
dec cx
mov si, 0
mov i, 0
mov j, 1

sort:
	loopi:
			mov si, i
			mov al, [bx + si]
			mov dx, i
			mov dh, 0
			mov j, dx
			inc j
			loopj:	mov si, j
					cmp al, [bx + si]
					jl skip
					xchg al, [bx + si]
					mov si, i
					mov [bx + si], al
					skip:	
							mov si, j
							inc si
							cmp dat, si
							jz endj
							inc j
							jmp loopj
			endj : inc i
loop sort

mov si, 0
mov dx, offset  res
mov ah, 09h
int 21h
mov cx, dat
outarr:
	mov dl, [bx + si]
	add dl, 30h
	mov ah, 02h
	int 21h
	inc si
loop outarr

mov ah, 4ch
int 21h
end