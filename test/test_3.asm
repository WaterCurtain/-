;���ڴ� FFFF:0 ~ FFFF:F �ڴ浥Ԫ�е����ݸ��Ƶ� 0:200 ~ 0:20F ��
assume cs:code


code segment

; 				mov ax,0FFFFH
; 				mov ds,ax

; 				mov bx,0

; 				mov cx,16

; setNumber:		push ds             ;����dsҪ��θı䣬������ʱ�浽ջ��
; 				mov dl,ds:[bx]

; 				mov ax,20H
; 				mov ds,ax
; 				mov ds:[bx],dl
; 				inc bx
				
; 				pop ds				;��ֵ��ջ��ȡ���ٴθ�ds
; 				loop setNumber


				;���Ϸ��� �˷�CPU�Ĳ���
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