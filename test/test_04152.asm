;  @ ��ʾ1234
;  @ 2021-4-15
;  @ GW
;  ��ʾ��������  �γ����һ �̵�

assume cs:code,ds:data,ss:stack

data segment
    dw 1234

data ends

stack segment stack

    db 128 dup (0)

stack ends


code segment

start:              mov ax,stack
                    mov ss,ax
                    mov sp,128

                    mov bx,data
                    mov ds,bx
                    mov si,0

                    mov bx,0B800H
                    mov es,bx
                    mov di,160*10
                    add di,40*2

                    mov ax,ds:[si]      ;diV��AX����̣�DX�������
                    mov dx,0
                    call short_div



                    mov ax,4c00H
                    int 21H


;===================================
short_div:          
                    mov cx,10
                    div cx
                    add dl,30H          ;����ASCII��
                    mov es:[di],dl
                    mov byte ptr es:[di+1],00000010B
                    
                    ;�ж����Ƿ�Ϊ0��Ϊ0���˳�
                    mov cx,ax
                    jcxz shortDiv
                    
                    mov dx,0
                    sub di,2
                    jmp short_div

shortDiv:
                   
                    ret


code ends

end start