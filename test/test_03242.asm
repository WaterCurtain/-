;@  ³ý·¨£¬¼ÆËã  100001 / 100
;@ 2021-3-24
;@ GW




assume cs:code,ds:data,ss:stack


data segment
    


data ends



stack segment stack

    dw 0,0,0,0
    dw 0,0,0,0
    dw 0,0,0,0
    dw 0,0,0,0


stack ends




code segment

    start:  
            mov ax,data
            mov ds,ax
            
            mov ax,stack
            mov ss,ax
            mov sp,32

            mov ax,86A1H
            mov dx,1

            mov bx,100

            div bx
            

            mov ax,4c00h

            int 21h

code ends
