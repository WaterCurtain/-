assume cs:code

; ����������2000H��1000H��ʼ��д0123456789ABCDEF



code segment
	
			;���öε�ַ��ƫ�Ƶ�ַ
			mov ax,2000H
			mov ds,ax
			mov bx,1000H

			mov dl,0
			mov cx,16
	
	
	;��ʼ������ݣ�����ظ����³��򼴿�
	
	;1.jmpָ����ת��cpu�ٴ��ظ�ִ�и�ָ��ɣ�Jmp 000A ,�޸�IP�Ĵ�����ֵ��
	;���ɵ�  mov ds:[bx],dl����ָ��
	;��ע�⣬debug�вſ��ԣ�Դ�ļ��в�����ôд

;setNumber:	mov ds:[bx],dl
;			inc dl       
;			inc bx           ;��ַ���������ݾ��Լ�1

;			jmp setNumber    ;��ţ��ڴ��ַ��,�������000aH, ����ת��076A:000a��ִ�е�һ������
							 ;���ǻ�������ת������ֻ��Ҫ16�Ρ�
			
			
			
	 		;2.��loopָ��
setNumber:	mov ds:[bx],dl
			inc dl       
			inc bx           ;��ַ���������ݾ��Լ�1
			loop setNumber

	



	mov ax,4c00H
	int 21H

code ends

end