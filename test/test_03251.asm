;@  用 div 计算 data 段中第一个数据除以第二个数据后的结果，商存在第三个数据的存储单元中
;@ 2021-3-25
;@ GW




assume cs:code,ds:data,ss:stack


data segment
    dd 100001
    dw 100
    dw 0
data ends



stack segment stack

    db 128 dup (0)


stack ends




code segment

    start:  mov ax,data 
            mov ds,ax
            
            mov ax,stack
            mov ss,ax
            mov sp,128

            mov ax,ds:[0]
            mov dx,ds:[2]
            mov si,6

            div word ptr ds:[4]

            mov ds:[si],ax            

            mov ax,4c00h

            int 21h

code ends

end start