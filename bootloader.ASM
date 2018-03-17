;----------COPYRIGHT 2018, Sjoerd Teunisse,  All rights reserved. ----------

;----------Magic key---------------
mov ax, 9ch
mov ss, ax
mov sp, 4096d
mov ax, 7c0h
mov ds, ax

;----------Write key---------------
mov ah, 0eh

mov al, 37h
mov al, 38h

int 10h
jmp $

;----------Set X Y---------------

mov ah, 01h
mov cx, 07h
int 10h

;----------X--------------------
mov bl, 0h

;----------Y--------------------
mov cl, 0h

;----------Keyboard mouse---------------
_mouseEvent:
 mov ah, 02h
 mov dl, bl
 mov dh, cl
 int 10h
 mov ah, 00h
 int 16h

 cmp al, 77h
 je _up

cmp al, 73h
 je _down

cmp al, 61h
 je _left

cmp al, 64h
 je _right
jmp _mouseEvent

_up:
add cl, 1h
jmp _mouseEvent

_down:
sub cl, 1h
jmp _mouseEvent

_left:
sub bl, 1h
jmp _mouseEvent

_right:
add bl, 1h
jmp _mouseEvent
