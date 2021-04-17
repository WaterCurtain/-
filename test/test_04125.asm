;@
;@ 2021-4-12
;@ GW
;

                           



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

                mov bx,data
                mov ds,bx
                
                mov ax,2233h
                mov ds:[0],ax
                ;mov word ptr ds:[2],4455H

                
                call word ptr ds:[0]
                ;call dword ptr ds:[0]
                
                mov ax,4c00H
                int 21H


            
               

code ends

end start