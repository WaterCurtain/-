;@  将数据段数据全部变成大写
;@ 2021-3-17
;@ GW




assume cs:code,ds:data,ss:stack


data segment
    
    db '1.fil           '
    db '2.edi           '
    db '3.sea           '
    db '4.vie           '
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

            
            mov bx,0
            mov cx,4


; 嵌套循环

    upROW:         
                push cx         ;外层循环数存放到栈中
                mov cx,3        ;内层循环数
                mov si,2
    
    upletter:   mov al,ds:[bx+si]
                and al,11011111B
                mov ds:[bx+si],al
                inc si
                loop upletter          ;cx -1

                pop cx                 ;内层循环结束，从栈中取出 cx 外层循环值
                add bx,16
                loop upRow             ; cx -1
            

            mov ax,4c00h

            int 21h

code ends

end start