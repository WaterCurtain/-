;@ 写入内存中一段数据，并累加到ax寄存其中
;@ 2021-3-17
;@ GW

assume cs:code

code segment

				;不用start时，可以用jmp begin，将begin写到跳转的指令处，修改bx的值即可

				dw 1,2,3,4,5,6,7,8   ;我们定义的数据，不是定义的指令，但是也写入了cs中

				;d : define  w: word

start:			mov bx,0
				mov ax,0
				mov cx,8
		

addNumber:		add ax,cs:[bx]
				add bx,2
				loop addNumber 


				mov ax, 4c00H
				int 21H


end start

code ends



end