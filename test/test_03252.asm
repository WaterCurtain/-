;@ ʵ���� Ѱַ��ʽ�ڽṹ�����ݷ����е�Ӧ��
;@ 2021-3-25
;@ GW


;��� ��data���е����ݰ����¸�ʽд�뵽tabel���У�������21���е����루ȡ����
;���Ҳ��������ĸ�ʽ������ table ����


assume cs:code,ds:data,ss:stack


data segment
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'
    ; �����Ǳ�ʾ 21 ��� 21 ���ַ���

    ;[54H]
    dd 16,22,382,1356,2389,8000,16000,24486,5065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ; �����Ǳ�ʾ 21 �깫˾������� 21��dword������

    ;[0A8H]
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
    ; ���ϱ�ʾ 21 �깫˾��Ա������ 21 ��word������



data ends



; ds:[0d2H]
tabel segment

    db 21 dup ('year summ ne ?? ')

tabel ends




stack segment stack

    db 128 dup (0)


stack ends




code segment

    start:      mov ax,stack
                mov ss,ax
                mov sp,128
            
                mov ax,data
                mov ds,ax           ;������Դ��
                mov ax,tabel
                mov es,ax               ;���ݷ��봦


                mov si,0                ;year ƫ�Ƶ�ַ
                mov di,21*4             ;revenue ƫ�Ƶ�ַ
                mov bx,21*4+21*4        ;people_number ƫ�Ƶ�ַ
                mov bp,0                ;table�Σ����������ڴ�ƫ�Ƶ�ַ

                mov cx,21
                ;���
    inputtable: push ds:[si]
                pop es:[bp]
                push ds:[si+2]
                pop es:[bp+2]


                mov ax,ds:[si+84+0]
                mov dx,ds:[si+84+2]
                mov es:[bp+5],ax
                mov es:[bp+7],dx

                push ds:[bx]
                pop es:[bp+0AH]

                ;div �Ĵ��� ����div �ڴ�
                div word ptr ds:[bx]
                mov es:[bp+0DH],dx

                add si,4
                add di,4
                add bx,2
                add bp,16    

                loop inputtable

                mov ax,4c00h

                int 21h

code ends

end start