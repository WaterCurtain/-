;@ д���ڴ���һ�����ݣ����ۼӵ�ax�Ĵ�����
;@ 2021-3-17
;@ GW

assume cs:code

code segment

				;����startʱ��������jmp begin����beginд����ת��ָ����޸�bx��ֵ����

				dw 1,2,3,4,5,6,7,8   ;���Ƕ�������ݣ����Ƕ����ָ�����Ҳд����cs��

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