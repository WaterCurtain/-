;@ 将 mov ax,4c00H  前命令复制到 0：200处
;@ 2021-3-15
;@ GW

assume cs:code

code segment
				mov ax,cs
				mov ds,ax
				mov ax,20H
				mov es,ax
				mov bx,0

				mov cx,23

s:				mov es:[bx],ds:[bx] ;默认 先将ds:[bx]中放入al，在将al放入es:[bx]
				inc bx
				loop s

				mov ax,4c00H
				int 21H


code ends

end
		