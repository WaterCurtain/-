;@ 检测点10.4
;@ 2021-4-12
;@ GW
;下面程序执行后，ax中的数值为多少

;内存地址           机器码          汇编指令
;1000:0            b8 00 00        mov ax,6
;1000:3            ff d0           call ax
;1000:5            40              inc ax
;1000:6            58              mov bp,sp
;                                  
;                                  

;answer: B

assume cs:code,ss:stack



stack segment stack
    db 16 dup (0)

stack ends




code segment


    start:      mov ax,6
                call ax
                inc ax
                mov bp,sp
                add ax,ss:[bp]

            
                mov ax,4c00H
                int 21H


            
               

code ends

end start
