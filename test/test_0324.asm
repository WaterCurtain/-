;@  8.6
;@ 2021-3-24
;@ GW


;Ѱַ��ʽ���ʵ�Ӧ�ã�ʹ���ǿ�����һ�ָ�����Ľṹ��������Ҫ��������⡣

assume cs:code,ds:data,ss:stack


data segment
    
    db 'dec'                ;��˾��
    db 'Gong Weia'           ;�ܲ���
    dw 137                  ;����  => 38  �������ݰ���λ�ڴ��ַ  12
    dw 40                   ;����  =>����70                     14
    db 'POP'                ;������Ʒ                           16
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