
; chapter 13

assume cs:code 

code segment 

start:  mov ax,cs
		mov ds,ax
		mov si,offset interpro

		mov ax,0        
		mov es,ax
		mov di,200h

		mov cx, offset interproend - offset interpro

		cld
		rep movsb
		
		mov ax,0
		mov es,ax
		mov word ptr es:[7ch*4],200h
		mov word ptr es:[7ch*4+2],0h
		
		mov ax,4c00h    
		int 21h
		
interpro:       push cx 
			push si
prostart:       mov cl,ds:[si]
			mov ch,0
			jcxz proend 
			; change lowcase to capital
			and byte ptr [si],11011111b
			inc si
			loop prostart
			
proend:         pop si  
			pop cx  
			iret
interproend:nop

code ends

end start
