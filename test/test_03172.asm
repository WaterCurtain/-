;@ д���ڴ���һ�����ݣ�����ջ�������ж��������������
;@ 2021-3-17
;@ GW

assume cs:code

code segment

				dw 123H,0456H,0789H,0ABCDH,0DEFH,0FEDH,0CBAH,0987H


				dw 0,0,0,0,0,0,0,0
				dw 0,0,0,0,0,0,0,0						;32���ֽڵ��������Լ����ŵ�ջ�ռ�



start:			mov ax,cs
				mov ss,ax
				mov sp,48         ;���Ϲ�48���ֽ�,����ջ��			

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