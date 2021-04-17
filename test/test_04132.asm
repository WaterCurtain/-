;@ 在屏幕中间分别显示 绿色，绿底红色，白底蓝色的字符串 “welcome to masm”
;@ 2021-4-13     4-05程序修改
;@ GW
;call和ret指令组织代码




assume cs:code,ds:data,ss:stack


data segment

    db 'welcome to masm!'       ;ds:[si]

    ;0000 0000
    ; rgb  rgb

    db 00000010B                ;红色
    db 00100100B                ;绿底红色
    db 01110001B                ;白底蓝色


data ends





stack segment stack
    db 128 dup (0)

stack ends




; 在屏幕中间分别显示 绿色，绿底红色，白底蓝色
; 的字符串 “welcome to masm”




code segment



    

    start:      mov ax,stack
                mov ss,ax
                mov sp,128

                call init_reg                  ;p执行
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

    Show:       mov si,0
                mov di,160*10 + 30*2    ;屏幕显示位置
                mov bx,16
                mov dx,0


                mov cx,3

    showMasm:   push bx
                push cx
                push si
                push di

                
                mov cx,16
                mov dh,ds:[bx]          ;字符属性
       
    showRow:    mov dl,ds:[si]          ;字符
                mov es:[di],dx
                add di,2
                inc si
                loop showRow

                pop di
                pop si
                pop cx
                pop bx

                add di,160              ;换行
                inc bx
                loop showMasm

                ret
;=================================================



code ends

end start