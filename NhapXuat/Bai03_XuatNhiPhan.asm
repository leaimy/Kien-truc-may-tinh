.MODEL SMALL
.STACK 100h
.DATA
   
   LINE1 DB 10,13, 'Nhap vao so thu nhat: $'
   LINE2 DB 10,13, 'Nhap vao so thu hai: $'
   LINE3 DB 10,13, 'Tong cua 2 so la: $'
   
   NUM1 DB ?
   NUM2 DB ?
   TONG DB ?
.CODE
    
   ; Lay du lieu tu vung DATA dat vao thanh ghi DS
   MOV AX, @DATA
   MOV DS, AX
   
   XOR BX, BX
   MOV BX, 0B3h ; 1011 0011
   
   MOV CX, 16
   
PRINT:
              
    SHL BX, 1   
    
    JNC PRINT_ZERO
    JC PRINT_ONE                       
                  
PRINT_ZERO:
    MOV AH, 2
    MOV DL, '0'
    INT 21h  
    JMP EXIT
    
PRINT_ONE:
    MOV AH, 2
    MOV DL, '1'
    INT 21h                  
              
EXIT:              
    LOOP PRINT
                 
                  
        
   ; Thoat chuong trinh
   MOV AH, 4Ch
   INT 21h
   
END