
.MODEL SMALL
.STACK 100h
.DATA             

    Operando1 DB 0Ah
    Operando2 DB 02h
    ResSuma DW 0000h 
    ResResta DW 0000h 
    ResMul DW 0000h 
    ResDiv DW 0000h 
    
.CODE  

Inicio:
               
    MOV AX, @data
    MOV DS, AX
    
    SUB AX, AX
               
    MOV AL, Operando1
    ADD AL, Operando2 
    MOV ResSuma, AX  
    
    SUB AX, AX
    
    MOV AL, Operando1
    SUB AL, Operando2 
    MOV ResResta, AX  
    
    SUB AX, AX
    
    MOV AL, Operando1
    MOV BL, Operando2  
    MUL BL
    MOV ResMul, AX   
    
    SUB AX, AX
    
    MOV AL, Operando1
    MOV BL, Operando2  
    DIV BL
    MOV ResDiv, AX
    
    MOV AH, 4Ch
    INT 21h
    
END Inicio