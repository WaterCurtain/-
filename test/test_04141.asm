; @ call ret Ӧ�ã�����
; @ 2021-4-14
; @ GW
;��һ������ ���һ������ ��������ַ�����0��β��������ʾ����Ļ��
;�ڶ������⣬��ʾ�����ַ�����ÿһ��һ��

                           



assume cs:code,ds:data,ss:stack


data segment

;           0123456789abcdef
    db     '1) restart pc ',0
    db     '2) start system ',0
    db     '3) show clock ',0
    db     '4) set clock ',0

    dw      0,15,32,2fh             ;ǰ���ĸ��ַ�������λ��ַ��
                                    ;Ҫ����16λ�Ĵ�����������������

data ends



stack segment stack
    db 128 dup (0)

stack ends



;��һ������ ���һ������ ��������ַ�����0��β��������ʾ����Ļ��
;�ڶ������⣬��ʾ�����ַ�����ÿһ��һ��

code segment


    start:      mov ax,stack
                mov ss,ax
                mov sp,128


                call init_reg
                

                call show_option


                mov ax,4c00H
                int 21H



;=================================
show_option:    mov bx,3dH
                mov di,160*10+ 30*2
                mov cx,4
                
showoption:     mov si,ds:[bx+0]
                call show_string
                add di,160          ;����  
                add bx,2
                loop showoption

                ret


;=================================




;==================================
show_string:    
                push cx                ;��ֹ������ļĴ�����ͻ
                push di


                mov cx,0
                
 showString:    mov cl,ds:[si]
                jcxz showStringRet      ;cxΪ0ʱ����ת
                mov es:[di],cl
                add di,2
                inc si
                jmp showString          ;ֱ��cl����0������ѭ��
                



showStringRet:  pop di
                pop cx
                ret



;==================================
init_reg:       mov bx,0B800H
                mov es,bx

                mov bx,data
                mov ds,bx
                ret
;==================================

            
               

code ends

end start