;@ ����洢����γ����д��
;@ 2021-3-17
;@ GW

assume cs:code,ds:data,ss:stack



stack segment stack   ;�ζ����� srtack�� �Ͳ��ᾯ����
				dw 0,0,0,0,0,0,0,0
				dw 0,0,0,0,0,0,0,0						;32���ֽڵ��������Լ����ŵ�ջ�ռ�


stack ends


data segment

				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H

data ends





code segment

				
start:			mov ax,stack
				mov ss,ax		
				mov sp,32    ;ƫ�ƿ���ջ��16���ֽ�

				mov ax,data
				mov ds,ax


				mov bx,0
				mov cx,8

pushData:		push ds:[bx]
				add bx,2
				loop pushData


				mov bx,0
				mov cx,8

popData:		pop ds:[bx]
				add bx,2
				loop popData


				mov ax, 4c00H
				int 21H



code ends


end start