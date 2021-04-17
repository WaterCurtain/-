; @ mul乘法指令
; @ 2021-4-14
; @ GW
; 计算100 * 10   和 1000 * 100

                           



assume cs:code,ds:data,ss:stack


data segment
   db 128 dup (0)
data ends



stack segment stack
    db 128 dup (0)

stack ends





code segment


    start:      mov ax,stack
                mov ss,ax
                mov sp,128

                mov ax,data
                mov ds,ax

;计算 100 * 10
                ; mov ax,100
                ; mov bl,10
                ; mul bl


;计算 1000 * 100
                mov ax,1000
                mov bx,100

                mov ds:[0],bx
                mul word ptr ds:[0]

                mov ax,4c00h
                int 21H
               

            
               

code ends

end start