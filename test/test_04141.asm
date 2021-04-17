; @ call ret 应用（三）
; @ 2021-4-14
; @ GW
;第一个问题 设计一个程序 程序处理的字符串以0结尾，并且显示在屏幕上
;第二个问题，显示四行字符串，每一行一个

                           



assume cs:code,ds:data,ss:stack


data segment

;           0123456789abcdef
    db     '1) restart pc ',0
    db     '2) start system ',0
    db     '3) show clock ',0
    db     '4) set clock ',0

    dw      0,15,32,2fh             ;前面四个字符串的首位地址，
                                    ;要放入16位寄存器所以用字型数据

data ends



stack segment stack
    db 128 dup (0)

stack ends



;第一个问题 设计一个程序 程序处理的字符串以0结尾，并且显示在屏幕上
;第二个问题，显示四行字符串，每一行一个

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
                add di,160          ;换行  
                add bx,2
                loop showoption

                ret


;=================================




;==================================
show_string:    
                push cx                ;防止和外面的寄存器冲突
                push di


                mov cx,0
                
 showString:    mov cl,ds:[si]
                jcxz showStringRet      ;cx为0时，跳转
                mov es:[di],cl
                add di,2
                inc si
                jmp showString          ;直到cl读到0跳出该循环
                



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