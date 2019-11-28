.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 10,13,'Nhap so thu nhat: $'
    MSG2 DB 10,13,'Nhap so thu hai: $'
    MSG3 DB 10,13,'Tong 2 so vua nhap la: $' 
    MSG4 DB 10,13,'Dung chuong trinh de kiem tra ket qua ^_^$'
    
    NUM1 DB ?
    NUM2 DB ?   
    TONG DB ?
.CODE

    ; Chuyen du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX        
    
    ; Xuat 1 so
    MOV AH, 9h 
    LEA DX, MSG1
    INT 21h   
    ; Nhap 1 so
    MOV AH, 1h
    INT 21h      
    SUB AL,30h
    MOV NUM1, AL 
    
    
    ; Xuat    
    MOV AH,9h
    LEA DX,MSG2
    INT 21h
    ;Nhap
    MOV AH,1h
    INT 21h  
    SUB AL,30h
    MOV NUM2,AL        
    
    ; Xuat thong bao tong
    MOV AH,9h
    LEA DX,MSG3
    INT 21h
    ;Tinh tong
    MOV AL,NUM1
    MOV BL,NUM2
    ADD AL,BL
    ADD AL,30h
    
    MOV TONG,AL 
    ;Xuat tong
    MOV AH,2h
    MOV DL,TONG
    INT 21h
    
    ;Dung chuong trinh
    MOV AH,9h
    LEA DX,MSG4
    INT 21h
    
    MOV AH, 1h
    INT 21h
    
    ; ========================================
    ;ket thuc chuong trinh
    MOV AH, 4Ch
    INT 21h
END 