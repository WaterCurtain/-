;�ñ�̽��мӷ����� 123*236 ���������� AX ��
assume cs:code


code segment
		
			mov ax,0
			mov cx,123   ;loop 122��

setNumber:	add ax,236
			loop setNumber   ;���Ͽ�ʼ��һ��
				


			mov ax,4c00H
			int 21H


code ends

end