;@ 检测点10.1
;@ 2021-4-12
;@ GW
;@ 补全程序，实现从内存 1000H：0000 处开始执行指令





assume cs:code,ss:stack



stack segment stack
    db 16 dup (0)

stack ends




code segment

    start:      mov ax,stack
                mov ss,ax
                mov sp,16


                mov ax,1000H
                push ax
                mov ax,0
                push ax

                retf

            
        
                mov ax,4c00H
                int 21H


            
               

code ends

end start
