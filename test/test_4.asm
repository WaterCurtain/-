;@ ��0:200~0:23F �ڴ������� 0-3F��63��������
;@ 2021-3-15
;@ GW

assume cs:code

code segment

				mov ax,20H
				mov es,ax

				mov bx,0
				
				mov cx,64

setNUmber:		mov es:[bx],bl     ;������bl����dl����ʡ�Ĵ���
				inc bx
				loop setNumber

				mov ax,4c00H
				int 21H


code ends

end