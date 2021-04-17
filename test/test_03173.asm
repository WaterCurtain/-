;@ 
;@ 2021-3-17
;@ GW


;1.依次用内存0:0 ~ 0:15 单元中的内容改成程序中的数据，完成程序
; assume cs:code

; code segment

; 				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H


; start:		mov ax,0
; 				mov ds,ax
; 				mov bx,0

; 				mov cx,8

; s:				mov ax,[bx]     ;默认段地址在ds寄存器中
; 				mov cs:[bx],ax
; 				add bx,2
; 				loop s

; 				mov ax,4c00H
; 				int 21H



; code ends

; end start

; end
		

;2.数据的传递通过栈来进行，栈设置在程序内
assume cs:code


code segment
				;程序的数据			
				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H
				dw 0,0,0,0,0,0,0,0,0    ;栈 空间

start:			mov ax,cs
				mov ss,ax
				mov sp,20H		;设置栈顶


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