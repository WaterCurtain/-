;@ ����Ļ�м�ֱ���ʾ ��ɫ���̵׺�ɫ���׵���ɫ���ַ��� ��welcome to masm��
;@ 2021-4-13     4-05�����޸�, �����޸ģ���ʾ�����ַ�
;@ GW
;call��retָ����֯����




assume cs:code,ds:data,ss:stack


data segment

    db 'welcome to masm!'       ;ds:[si]

    ;0000 0000
    ; rgb  rgb

    db 10000010B                ;��ɫ
    db 10100100B                ;�̵׺�ɫ
    db 11110001B                ;�׵���ɫ
    db 'xxxxxxxxxxxxxxxx'


data ends





stack segment stack
    db 128 dup (0)

stack ends




; ����Ļ�м�ֱ���ʾ ��ɫ���̵׺�ɫ���׵���ɫ
; ���ַ��� ��welcome to masm��




code segment



    

    start:      mov ax,stack
                mov ss,ax
                mov sp,128


                call init_reg            ;pִ��

                mov si,0                ;��ʾ'welcome to masm'
                mov di,160*10 + 30*2    ;��Ļ��ʾλ��
                mov bx,16
                mov dx,0
                
                call Show


                call init_reg
                mov si,19               ;��ʾ'xxxxxxxxxxx'
                mov di,160*15 + 30*2    ;��Ļ��ʾλ��
                mov bx,16
                mov dx,0

                call Show

                
                

                mov ax,4c00H
                int 21H



;=============================================
    init_reg:   mov bx,data
                mov ds,bx

                mov bx,0B800H
                mov es,bx
                ret

               
;============================================

    Show:       
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

                ret
;=================================================



code ends

end start