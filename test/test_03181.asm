;@  ��Сдת��
;@ 2021-3-18
;@ GW


;41H   0100 0001       61H 0110 0001
;42H   0100 0010       62H 0110 0010
;43H   0100 0011       63H 0110 0011
;44H   0100 0100       64H 0110 0100


assume cs:code,ds:data,ss:stack


data segment
					db 'BaSic'				;����һ���ַ���ת���ɴ�д
					db 'iNForMaTion'		;���ڶ����ַ���ת����Сд
data ends


stack segment stack
					dw 0,0,0,0,0,0,0,0
					dw 0,0,0,0,0,0,0,0

stack ends



code segment

		start:		mov bx,stack
					mov ss,bx
					mov sp,128

					mov bx,data
					mov ds,bx

					mov bx,0
					mov cx,5

upLeter:			mov al,ds:[bx]
					and al,11011111B
					mov ds:[bx],al
					inc bx
					loop upLeter


					mov bx,5
					mov cx,11

lowerLeter:			mov al,ds:[bx]
					or al,00100000B
					mov ds:[bx],al
					inc bx
					loop lowerLeter


					mov ax,4c00H
					int 21H

					


code ends

end start





;;�򻯳���

; 		start:		mov bx,stack	
; 					mov ss,bx
; 					mov sp,32

; 					mov bx,data
; 					mov ds,bx

; 					mov bx,0	
; 					mov cx,5

; changeLeter:		mov al,ds:[bx]
; 					and al,11011111B
; 					mov ds:[bx],al

; 					mov dl,ds:[bx+5]
; 					or dl,00100000B
; 					mov ds:[bx+5],dl
					
; 					inc bx

; 					loop changeLeter