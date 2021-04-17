;@ 实验五 P134  segment  分配内存空间大小问题
;@ 2021-3-17
;@ GW

; ;1.
; assume cs:code,ds:data,ss:stack


; data segment

; 				dw 0123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H

; data ends

; stack segment stack
; 				dw 0,0,0,0,0,0,0,0		;16个字节当做我们自己安排的栈空间


; stack ends



; code segment

; start:			mov ax,stack
; 				mov ss,ax
; 				mov sp,10H

; 				mov ax,data
; 				mov ds,ax

; 				push ds:[0]
; 				push ds:[2]
; 				pop ds:[2]
; 				pop ds:[0]


; 				mov ax, 4c00H
; 				int 21H



; code ends


; end start



; ;2.
; assume cs:code,ds:data,ss:stacl


; data segment

; 				dw 0123H,0456H

; data ends


; stack segment

; 				dw 0,0
; stack ends


; code segment

; start: 			mov ax,stack
; 				mov ss,ax
; 				mov sp,16

; 				mov ax,data
; 				mov ds,ax

; 				push ds:[0]
; 				push ds:[2]

; 				pop ds:[2]	
; 				pop ds:[2]

; 				mov ax,4c00H
; 				int 21H	

; code ends

; end start





; ;3.
; assume cs:code,ds:data,ss:stack




; code segment

; start: 			mov ax,2000H

; 				mov ax,4c00H
; 				int 21H	

; code ends






; data segment

; 				dw 0123H,0456H

; data ends


; stack segment stack

; 				dw 0,0
; stack ends

; end



;5. 编写 code 段中的代码，将 a 段和 b 段中的数据
;依次相加，将结果存在 c 段中

assume cs:code

a segment

				db 1,2,3,4,5,6,7,8

a ends

b segment
				db 1,2,3,4,5,6,7,8


b ends


c segment
				db 0,0,0,0,0,0,0,0

c ends

code segment


start:			

				mov ax,c
				mov es,ax

				mov bx,0
				mov cx,8

;没有设置栈，所以考虑其他办法

addNumber:		mov ax,a
				mov ds,ax

				
				mov dx,0
				mov dl,ds:[bx]
				
				mov ax,b
				mov ds,ax
				add dl,ds:[bx]

				mov es:[bx],dl
				inc bx

				loop addNumber

				mov ax,4c00H
				int 21H

code ends

end start






;@  a段数据逆向存放到 b段
;@ 2021-3-17
;@ GW

assume cs:code


a segment

				dw 1,2,3,4,5,6,7,8,9,0ah,0bH,0ch,0dh,0eh,0fh,0ffh
				
a ends


b segment 
				dw 0,0,0,0,0,0,0,0

b ends


code segment


; start:			mov ax,a
; 				mov ds,ax

; 				mov ax,b
; 				mov es,ax

; 				mov bx,0
; 				mov cx,8

; reverse:		push ds:[bx]
; 				add bx,2
; 				loop reverse

; 				mov bx,0
; 				mov cx,8
; store:			pop es:[bx]
; 				add bx,2
; 				loop store


; 				mov ax,4c00H
; 				int 21H
; code ends



; end start;还可以让 b 段成为栈区，直接push a 里面的数据，即可完成逆序存放


start:			mov ax,a
				mov ds,ax

				mov ax,b
				mov ss,ax
				mov sp,16		;使得 b 段成为栈区


				mov bx,0
				mov cx,8

reverse:		push ds:[bx]		
				add bx,2
				loop reverse

				mov ax,4c00H
				int 21H

code ends

end start