;@  8.6
;@ 2021-3-24
;@ GW


;寻址方式的适当应用，使我们可以以一种更合理的结构来看待所要处理的问题。

assume cs:code,ds:data,ss:stack


data segment
    
    db 'dec'                ;公司名
    db 'Gong Weia'           ;总裁名
    dw 137                  ;排名  => 38  字型数据按低位内存地址  12
    dw 40                   ;收入  =>增加70                     14
    db 'POP'                ;著名产品                           16
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
            
            mov word ptr ds:[bx+12],38
            add word ptr ds:[bx+14],70

            mov si,0

            mov byte ptr ds:[bx+16+si],'v'
            inc si
            mov byte ptr ds:[bx+16+si],'A'
            inc si
            mov byte ptr ds:[bx+16+si],'X'



            

            mov ax,4c00h

            int 21h

code ends

end start