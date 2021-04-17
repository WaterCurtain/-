; @ mul�˷�ָ��
; @ 2021-4-15
; @ GW
; ����100 * 10   �� 1000 * 100

                           



assume cs:code,ds:data,ss:stack


data segment
   dw 11,22,33,44,55,66,77,88
   dd 0,0,0,0,0,0,0,0
data ends



stack segment stack
    db 128 dup (0)

stack ends





code segment


    start:      mov ax,stack
                mov ss,ax
                mov sp,128


                call init_reg
                
                call num_cube

                mov ax,4c00h
                int 21H
               
;================================================
    get_cube:   
                push bx           ;��push��pop ax��ԭ��
                mov ax,bx         ;��ax��dx��Ϊ����ֵ������5���������
                mul bx
                mul bx
                pop bx

                ret

;=================================================
    num_cube:   mov si,0
                mov di,16

                mov cx,8

    numcube:    mov bx,ds:[si]
                call get_cube
                mov es:[di+0],ax
                mov es:[di+2],dx
                add si,2
                add di,4
                loop numcube

                ret

            
;===============================================
    init_reg:   mov ax,data
                mov es,ax

                mov ax,data
                mov ds,ax     

                ret       

code ends

end start