;@ 
;@ 2021-3-17
;@ GW


;1.�������ڴ�0:0 ~ 0:15 ��Ԫ�е����ݸĳɳ����е����ݣ���ɳ���
; assume cs:code

; code segment

; 				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H


; start:		mov ax,0
; 				mov ds,ax
; 				mov bx,0

; 				mov cx,8

; s:				mov ax,[bx]     ;Ĭ�϶ε�ַ��ds�Ĵ�����
; 				mov cs:[bx],ax
; 				add bx,2
; 				loop s

; 				mov ax,4c00H
; 				int 21H



; code ends

; end start

; end
		

;2.���ݵĴ���ͨ��ջ�����У�ջ�����ڳ�����
assume cs:code


code segment
				;���������			
				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H
				dw 0,0,0,0,0,0,0,0,0    ;ջ �ռ�

start:			mov ax,cs
				mov ss,ax
				mov sp,20H		;����ջ��


				mov ax,0
				mov ds,ax
				mov bx,0
				mov cx,8

s:				push ds:[bx]
				pop cs:[bx]

				add bx,2
				loop s



				mov ax,4c00H
				int 21H



code ends

end start

end