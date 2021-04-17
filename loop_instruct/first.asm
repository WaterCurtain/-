assume cs:code

; 假设我们向2000H：1000H开始填写0123456789ABCDEF



code segment
	
			;设置段地址和偏移地址
			mov ax,2000H
			mov ds,ax
			mov bx,1000H

			mov dl,0
			mov cx,16
	
	
	;开始存放数据，多次重复以下程序即可
	
	;1.jmp指令跳转，cpu再次重复执行该指令即可，Jmp 000A ,修改IP寄存器的值，
	;即可到  mov ds:[bx],dl该条指令
	;但注意，debug中才可以，源文件中不能这么写

;setNumber:	mov ds:[bx],dl
;			inc dl       
;			inc bx           ;地址和所存数据均自加1

;			jmp setNumber    ;标号（内存地址）,被翻译成000aH, 即跳转到076A:000a，执行第一条命令
							 ;但是会无限跳转，我们只需要16次。
			
			
			
	 		;2.用loop指令
setNumber:	mov ds:[bx],dl
			inc dl       
			inc bx           ;地址和所存数据均自加1
			loop setNumber

	



	mov ax,4c00H
	int 21H

code ends

end