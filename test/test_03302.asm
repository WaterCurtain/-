;@ ����9.2
;@ 2021-3-30
;@ GW




assume cs:code,ds:data,ss:stack


data segment
   db 128 dup (0)


data ends




stack segment stack

    db 128 dup (0)


stack ends



;��ȫ�������� jcxz ָ�ʵ�����ڴ� 2000H ����
;���ҵ�һ��ֵΪ0���ֽڣ��ҵ��󣬽�����ƫ�Ƶ�ַ�洢dx��



code segment

    start:      mov ax,2000H
                mov ds,ax
                mov bx,0

                mov ch,0
    s:          mov cl,ds:[bx]      ;�ֽ�0 
                jcxz ok
                inc bx
                jmp short s


    ok:         mov dx,bx
                
                mov ax,4c00h
                int 21h


code ends

end start