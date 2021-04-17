;@ 想0:200~0:23F 内存中输入 0-3F（63）的数据
;@ 2021-3-15
;@ GW

assume cs:code

code segment

				mov ax,20H
				mov es,ax

				mov bx,0
				
				mov cx,64

setNUmber:		mov es:[bx],bl     ;可以用bl代替dl，节省寄存器
				inc bx
				loop setNumber

				mov ax,4c00H
				int 21H


code ends

end