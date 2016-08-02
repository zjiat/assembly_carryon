assume cs:code

code segment
    
start:
    ;install interrupt program
    ;copy program to spec memory
    mov ax,cs
    mov ds,ax
    mov si,offset do0

    mov ax,0
    mov es,ax 
    mov di,200h

    mov cx,offset do0end - offset do0
    cld
    rep movsb


    ;change the interrupt vector
    mov ax,0
    mov es,ax
    mov word ptr es:[0*4],200h
    mov word ptr es:[0*4+2],0

    mov ax,4c00h
    int 21h


    ;interrupt program here!
    ;string to display
do0:jmp short do0start
    db "it is overflow here!"

do0start:
    mov ax,0b800h
    mov es,ax
    mov di,12*160+30*2

    mov ax,0
    mov ds,ax
    mov si,202h

    mov cx,20

s:  mov al,[si]
    mov es:[di],al
    inc si
    add di,2
    loop s
    
    mov ax,4c00h
    int 21h

do0end: nop


code ends

end start


