;@ 实验七 寻址方式在结构化数据访问中的应用
;@ 2021-3-25
;@ GW


;编程 将data段中的数据按如下格式写入到tabel段中，并计算21年中的收入（取整）
;结果也按照下面的格式保存在 table 段中


assume cs:code,ds:data,ss:stack


data segment
    db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'
    ; 以上是表示 21 年的 21 个字符串

    ;[54H]
    dd 16,22,382,1356,2389,8000,16000,24486,5065,97479,140417,197514
    dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
    ; 以上是表示 21 年公司总收入的 21个dword型数据

    ;[0A8H]
    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800
    ; 以上表示 21 年公司雇员人数的 21 个word型数据



data ends



; ds:[0d2H]
tabel segment

    db 21 dup ('year summ ne ?? ')

tabel ends




stack segment stack

    db 128 dup (0)


stack ends




code segment

    start:      mov ax,stack
                mov ss,ax
                mov sp,128
            
                mov ax,data
                mov ds,ax           ;数据来源处
                mov ax,tabel
                mov es,ax               ;数据放入处


                mov si,0                ;year 偏移地址
                mov di,21*4             ;revenue 偏移地址
                mov bx,21*4+21*4        ;people_number 偏移地址
                mov bp,0                ;table段，放入数据内存偏移地址

                mov cx,21
                ;年份
    inputtable: push ds:[si]
                pop es:[bp]
                push ds:[si+2]
                pop es:[bp+2]


                mov ax,ds:[si+84+0]
                mov dx,ds:[si+84+2]
                mov es:[bp+5],ax
                mov es:[bp+7],dx

                push ds:[bx]
                pop es:[bp+0AH]

                ;div 寄存器 还是div 内存
                div word ptr ds:[bx]
                mov es:[bp+0DH],dx

                add si,4
                add di,4
                add bx,2
                add bp,16    

                loop inputtable

                mov ax,4c00h

                int 21h

code ends

end start