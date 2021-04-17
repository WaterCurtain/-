;将内存 FFFF:0 ~ FFFF:F 内存单元中的数据复制到 0:200 ~ 0:20F 中
assume cs:code


code segment

; 				mov ax,0FFFFH
; 				mov ds,ax

; 				mov bx,0

; 				mov cx,16

; setNumber:		push ds             ;由于ds要多次改变，所以临时存到栈中
; 				mov dl,ds:[bx]

; 				mov ax,20H
; 				mov ds,ax
; 				mov ds:[bx],dl
; 				inc bx
				
; 				pop ds				;将值从栈中取出再次给ds
; 				loop setNumber


				;以上方法 浪费CPU的操作
				mov ax,0FFFFH
				mov ds,ax

				mov ax,20H
				mov es,ax

				mov bx,0
				mov cx,16

setNumber:		mov dx,ds:[bx]      ;push ds:[bx]
				mov es:[bx],dx		;pop es:[bx]
				inc bx
				
				loop setNumber

				mov ax,4c00h
				int 21H

code ends

end