;@ 03175 5�ļ򻯳���
;@ 2021-3-18
;@ GW
;5. ��д code ���еĴ��룬�� a �κ� b ���е�����
;������ӣ���������� c ����

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


start:			mov ax,a
                mov ds,ax
                
                mov bx,0
                mov cx,8

addNumber:      mov al,ds:[bx]
                add al,ds:[bx+16]

                mov ds:[bx+32],al
                inc bx
                loop addNumber




				mov ax,4c00H
				int 21H

code ends

end start