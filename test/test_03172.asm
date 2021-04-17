;@ 写入内存中一段数据，利用栈将程序中定义的数据逆序存放
;@ 2021-3-17
;@ GW

assume cs:code

code segment

				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H


				dw 0,0,0,0,0,0,0,0
				dw 0,0,0,0,0,0,0,0						;32个字节当做我们自己安排的栈空间



start:			mov ax,cs
				mov ss,ax
				mov sp,48         ;以上共48个字节,设置栈顶			

				mov bx,0
				mov cx,8

pushData:		push cs:[bx]
				add bx,2
				loop pushData


				mov bx,0
				mov cx,8

popData:		pop cs:[bx]
				add bx,2
				loop popData


				mov ax, 4c00H
				int 21H



code ends

end start


end