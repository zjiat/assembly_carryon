; experiment 13 exercise 1

assume cs:code

code segment

start:
	mov ax,cs       
	mov ds,ax
	mov si,offset interpro

	mov ax,0
	mov es,ax
	mov di,200h

	mov cx,offset interproend - offset interpro     

	cld 
	rep movsb

	mov ax,0        
	mov es,ax
	mov word ptr es:[7ch*4],200h
	mov word ptr es:[7ch*4+2],0

	mov ax,4c00h
	int 21h

interpro:
	push bx
	mov bl,cl
	mov cl,0
	mov ax,0b800h
	mov es,ax
	;mov ax,160*[dh-1]+2*[dl-1]
	dec dh
	mov al,160
	mul dh
	mov bx,ax
	dec dl
	mov al,2
	mul dl
	add ax,bx

	mov di,ax

s:      mov ch,ds:[si]
	jcxz ok
	mov es:[di],ch
	inc si
	inc di  
	mov es:[di],bl
	inc di
	; we can operate two byte once here

	jmp short s

ok:     pop bx
	iret
interproend: nop



code ends

end start
