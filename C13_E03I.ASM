; Chapter 13 part 3 interrupt program

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
		mov word ptr es:[7ch*4+2],0
				
		mov ax,4c00h
		int 21h


interpro:       push bp   
		mov bp,sp
		dec cx
		jcxz ok
			 
		add ss:[bp+2],bx

ok:             pop bp        
		iret

interproend: nop

code ends

end start
