;@ ����10.2
;@ 2021-4-12
;@ GW
;�������ִ�к�ax�е���ֵΪ����

;�ڴ��ַ           ������          ���ָ��
;1000:0            b8 00 00        mov ax,0
;1000:3            e8 01 00        call s
;1000:6            40              inc ax
;1000:7            58            s:pop ax

assume cs:code,ss:stack



stack segment stack
    db 16 dup (0)

stack ends




code segment


    start:      mov ax,0
                call s
                inc ax
    s:          pop ax

        
                mov ax,4c00H
                int 21H


            
               

code ends

end start