;@ 实验八
;@ 2021-3-30
;@ GW


;分下下面的程序，在运行前思考，这个程序可以正确返回吗
;运行后再思考：为什么是这种结果？
;通过这个程序加深对相关内容的理解


assume cs:code,ds:data,ss:stack


data segment
   db 128 dup (0)


data ends




stack segment stack

    db 128 dup (0)


stack ends




code segment


                mov ax,4c00h;3
                int 21h;2

        start:  mov ax,0;3
        s:      nop     ;EB
                nop     ;F6  从下一指令往前跳10个字节  2个

                mov di,offset s;
                mov si,offset s2
                mov ax,cs:[si]
                mov cs:[di],ax

        s0:     jmp short

        s1:     mov ax,0;3
                int 21h;2
                mov ax,0;3
        
        s2:     jmp short s1;EBxx    2
                nop;          跳到s1  -10（补码为F6）  EBF6          


code ends

end start