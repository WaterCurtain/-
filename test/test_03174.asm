;@ 逆序存储，多段程序改写。
;@ 2021-3-17
;@ GW

assume cs:code,ds:data,ss:stack



stack segment stack   ;段定义后加 srtack后 就不会警告了
				dw 0,0,0,0,0,0,0,0
				dw 0,0,0,0,0,0,0,0						;32个字节当做我们自己安排的栈空间


stack ends


data segment

				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H

data ends





code segment

				
start:			mov ax,stack
				mov ss,ax		
				mov sp,32    ;偏移考虑栈段16个字节

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