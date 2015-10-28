
.MODEL SMALL
.STACK 100h
.DATA             
      Texto DB 'Please enter a 16 bits binary number:$'    
      varc1 DW DUP(0)
      varc2 DW DUP(0)
      varex DW DUP(0)
.CODE  

Inicio:
               
    mov AX, @data
    mov DS, AX
    
    sub AX, AX
    
    mov ah, 9
    lea dx, Texto
    int 21h     

    xor cx, cx
    mov cl, 15     
    Guardar:   
        mov ah, 1 
        int 21h
        xor ah, ah       
        sub al, 30h  
        add varc1, ax  
        shl varc1, 1
    loop Guardar 
 
    mov ah, 1 
    int 21h
    xor ah, ah       
    sub al, 30h  
    add varc1, ax 
                                                                        
    mov ax, varc1  
    mov varc2, ax
    mov varex, ax
    
    neg varc2   
    
    xor varex, 8000h   
    
    mov ah, 4Ch
    int 21h
    
END Inicio
