assume cs:code


code segment


				mov ax,0FFFFH
				mov ds,ax
				mov bx,0

				mov dx,0		;��ʼ��

				mov cx,16

				mov ax,0		; ah = 0 al = ��ȡ���ֽ�����

addNumber:		mov al,ds:[bx]
				add dx,ax
				inc bx
				loop addNumber


				mov ax,4c00h
				int 21H

code ends

end