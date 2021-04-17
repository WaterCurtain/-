;@ 组织代码的方式
;@ 2021-4-01
;@ GW




assume cs:code,ds:data,ss:stack


data segment
   db 128 dup (0)


data ends




stack segment stack

    db 128 dup (0)


stack ends




code segment

    start:      mov ax,2000H
                mov ds,ax
                mov bx,0


                mov ax,offset s1
                mov ds:[0],ax

                mov ax,offset s2
                mov ds:[2],ax

                mov ax,offset s3
                mov ds:[4],ax

                mov bx,0
                jmp ds:[bx]          ;修改 IP 寄存器的值


    over:       mov ax,4c00H
                int 21H

    s1:          mov ax,1000H
                jmp over

    s2:         mov ax,1001H
                jmp over

    s3:         mov ax,1002H
                jmp over



code ends

end start