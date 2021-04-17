;@ 检测点10.3
;@ 2021-4-12
;@ GW
;下面程序执行后，ax中的数值为多少

;内存地址           机器码          汇编指令
;1000:0            b8 00 00        mov ax,0
;1000:3            9a 09 00 00 10  call far ptr s   将下一条指令的cs和ip先后push入栈中
;1000:6            40              inc ax
;1000:7            58            s:pop ax
;                                  add ax,ax
;                                  pop bx                 
;                                  add ax,bx

;answer:1010h

assume cs:code,ss:stack



stack segment stack
    db 16 dup (0)

stack ends




code segment


    start:      mov ax,0
                call far ptr s
                inc ax 
    s:          pop ax
                add ax,ax
                pop bx
                add ax,bx


                mov ax,4c00H
                int 21H


            
               

code ends

end start