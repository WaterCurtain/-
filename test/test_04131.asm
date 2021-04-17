;@ 检测点 10.5
;@ 2021-4-13
;@ GW
;2、ax,bx的值为多少
;answer ax = 1，bx = 0

                           



assume cs:code,ss:stack


stack segment stack
    dw 8 dup (0)

stack ends




code segment


    start:      mov ax,stack
                mov ss,ax
                mov sp,16
                mov word ptr ss:[0],offset s
                mov ss:[2],cs
                call dword ptr ss:[0]
                nop

    s:          mov ax,offset s
                sub ax,ss:[0cH]
                mov bx,cs
                sub bx,ss:[0eH]

                mov ax,4c00H
                int 21H


            
               

code ends

end start