;@ 03175 5的简化程序
;@ 2021-3-18
;@ GW
;5. 编写 code 段中的代码，将 a 段和 b 段中的数据
;依次相加，将结果存在 c 段中

assume cs:code

a segment

				db 1,2,3,4,5,6,7,8

a ends

b segment
				db 1,2,3,4,5,6,7,8


b ends


c segment
				db 0,0,0,0,0,0,0,0

c ends

code segment


start:			mov ax,a
                mov ds,ax
                
                mov bx,0
                mov cx,8

addNumber:      mov al,ds:[bx]
                add al,ds:[bx+16]

                mov ds:[bx+32],al
                inc bx
                loop addNumber




				mov ax,4c00H
				int 21H

code ends

end start