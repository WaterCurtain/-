;@ �� mov ax,4c00H  ǰ����Ƶ� 0��200��
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

s:				mov es:[bx],ds:[bx] ;Ĭ�� �Ƚ�ds:[bx]�з���al���ڽ�al����es:[bx]
				inc bx
				loop s

				mov ax,4c00H
				int 21H


code ends

end
		