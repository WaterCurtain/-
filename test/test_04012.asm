;@ ����9.1
;@ 2021-4-01
;@ GW




; assume cs:code,ds:data,ss:stack


; data segment
   
;     db 0
;     dw offset start


; data ends




; stack segment stack
;     db 128 dup (0)

; stack ends




; ; jmp ָ��ִ�к�cs:ip ָ�����ĵ�һ��ָ���data����Ӧ����ζ�������

; code segment

;     start:      mov ax,data
;                 mov ds,ax
;                 mov bx,0

;                 jmp word ptr ds:[bx+1]
                

;                 mov ax,4c00H
;                 int 21H

               

; code ends

; end start



;2��ͬ��Ҫ��

assume cs:code,ds:data,ss:stack


data segment
   dd 12345678H


data ends




stack segment stack

    db 128 dup (0)

stack ends




; jmp ָ��ִ�к�cs:ip ָ�����ĵ�һ��ָ���data����Ӧ����ζ�������

code segment

    start:      mov ax,data
                mov ds,ax
                mov bx,0

                mov word ptr ds:[bx+0],offset start
                mov ds:[bx+2],cs


                jmp dword ptr ds:[0]    ;IP = ds:[0]    CS = ds:[2]
                

                mov ax,4c00H
                int 21H

               

code ends

end start