;@ 检测点9.2
;@ 2021-3-30
;@ GW




assume cs:code,ds:data,ss:stack


data segment
   db 128 dup (0)


data ends




stack segment stack

    db 128 dup (0)


stack ends



;补全程序，利用 jcxz 指令，实现在内存 2000H 段中
;查找第一个值为0的字节，找到后，将它的偏移地址存储dx中



code segment

    start:      mov ax,2000H
                mov ds,ax
                mov bx,0

                mov ch,0
    s:          mov cl,ds:[bx]      ;字节0 
                jcxz ok
                inc bx
                jmp short s


    ok:         mov dx,bx
                
                mov ax,4c00h
                int 21h


code ends

end start