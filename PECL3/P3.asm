.model small
.stack 100h
.data

Texto1 DB "This program compare strings", 13,10,'$'
Texto2 DB "Please, enter the first string: ", 13,10,'$'
Texto3 DB "Please, enter the second string: ", 13,10,'$'
Texto4 DB "The number of different letters are: ", '$'

varc1 DB 121,0, 121 DUP(0)
varc2 DB 121,0, 121 DUP(0)
dif DB 0
division DB 10
Otralinea DB 13,10,'$'
.code


mostrar_caracteres macro caracteres

		xor ax,ax
		xor bx,bx
		xor cx,cx

		mov al,caracteres

		div division
		add ah, 30h
		push ax

		xor ah, ah
		div division
		add ah, 30h
		push ax

		xor ah, ah
		div division
		add ah, 30h
		push ax


        pop dx
        mov dl, dh
		mov ah,02h
		int 21h

        pop dx
        mov dl, dh
		mov ah,02h
		int 21h

        pop dx
        mov dl, dh
		mov ah,02h
		int 21h
endm
    


comparacion macro op1,op2
xor SI, SI
xor cx, cx
xor dx, dx
xor bx,bx
mov cx, 120
inc SI
     comparar:
     	inc SI     
     	
     	xor bx, bx
     	xor dx, dx
     	
		mov bl,op1[SI]
		mov dl,op2[SI] 
	
	    add bh, bl
	    add dh, dl
	    
	    sub bh, dh 
	    cmp bh, 13
	    jz continue
	    
	    cmp bh, -13
	    jz continue        
		
		cmp bl,dl       
		jz continue     
		
		inc dif
        continue:
            loop comparar
endm

Inicio:
mov ax, @data
mov ds, ax

mov ah,9
lea dx,Texto1
int 21h

lea dx,Texto2
int 21h

mov ah,0Ah
lea dx,varc1
int 21h

mov ah, 9
lea dx, Otralinea
int 21h

mov ah,9
lea dx,Texto3
int 21h

mov ah,0Ah
lea dx,varc2
int 21h

comparacion varc1, varc2


mov ah, 9
lea dx, Otralinea
int 21h

mov ah,9
lea dx,Texto4
int 21h

mostrar_caracteres dif

mov ah, 4Ch
int 21h

END Inicio
