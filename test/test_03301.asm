;@ ʵ���
;@ 2021-3-30
;@ GW


;��������ĳ���������ǰ˼����������������ȷ������
;���к���˼����Ϊʲô�����ֽ����
;ͨ�������������������ݵ����


assume cs:code,ds:data,ss:stack


data segment
   db 128 dup (0)


data ends




stack segment stack

    db 128 dup (0)


stack ends




code segment


                mov ax,4c00h;3
                int 21h;2

        start:  mov ax,0;3
        s:      nop     ;EB
                nop     ;F6  ����һָ����ǰ��10���ֽ�  2��

                mov di,offset s;
                mov si,offset s2
                mov ax,cs:[si]
                mov cs:[di],ax

        s0:     jmp short

        s1:     mov ax,0;3
                int 21h;2
                mov ax,0;3
        
        s2:     jmp short s1;EBxx    2
                nop;          ����s1  -10������ΪF6��  EBF6          


code ends

end start