;@ ����Ļ�м�ֱ���ʾ ��ɫ���̵׺�ɫ���׵���ɫ���ַ��� ��welcome to masm��
;@ 2021-4-05
;@ GW







assume cs:code,ds:data,ss:stack


data segment

    db 'welcome to masm!'       ;ds:[si]

    ;0000 0000
    ; rgb  rgb

    db 00000010B                ;��ɫ
    db 00100100B                ;�̵׺�ɫ
    db 01110001B                ;�׵���ɫ


data ends





stack segment stack
    db 128 dup (0)

stack ends




; ����Ļ�м�ֱ���ʾ ��ɫ���̵׺�ɫ���׵���ɫ
; ���ַ��� ��welcome to masm��

code segment



    

    start:      mov ax,data
                mov ds,ax
                

                mov bx,0B800H
                mov es,bx

                mov si,0
                mov di,160*10 + 30*2    ;��Ļ��ʾλ��
                mov bx,16
                mov dx,0


                mov cx,3

    showMasm:   push bx
                push cx
                push si
                push di

                
                mov cx,16
                mov dh,ds:[bx]          ;�ַ�����
       
    showRow:    mov dl,ds:[si]          ;�ַ�
                mov es:[di],dx
                add di,2
                inc si
                loop showRow

                pop di
                pop si
                pop cx
                pop bx

                add di,160              ;����
                inc bx
                loop showMasm
                

                mov ax,4c00H
                int 21H

               

code ends

end start