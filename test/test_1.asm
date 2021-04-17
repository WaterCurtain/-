;用编程进行加法计算 123*236 结果过存放在 AX 中
assume cs:code


code segment
		
			mov ax,0
			mov cx,123   ;loop 122次

setNumber:	add ax,236
			loop setNumber   ;加上开始的一次
				


			mov ax,4c00H
			int 21H


code ends

end