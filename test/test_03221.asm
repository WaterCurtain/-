;@  将数据段数据第一个首字母变成大写
;@ 2021-3-17
;@ GW




assume cs:code,ds:data,ss:stack


data segment
    
    db '1.file          '
    db '2.edit          '
    db '3.seach         '
    db '4.view          '
    db '5.options       ' 
    db '6.help          '
    
data ends



stack segment stack


stack ends




code segment

    start:  
            mov ax,data
            mov ds,ax

            mov bx,0
            mov si,2
            mov cx,6

upletter:   mov al,ds:[bx+si]
            and al,11011111B            ;0100  <-  0110  
            mov ds:[bx+si],al

            add bx,16

            loop upletter

            mov ax,4c00h

            int 21h

code ends

end start