.MODEL SMALL
.DATA 
   HA1 DB 10,13,'Nhap so dau tien: $'
   HA2 DB 10,13,'Nhap so thu hai: $'
   HA3 DB 10,13,'Tong 2 so vua nhap la: $'
   
   NUM1 DB ?
   NUM2 DB ?
   TONG DB ?
.CODE
   ;Lay du lieu tu data bo vao ds
   MOV AX,@DATA
   MOV DS,AX
   
JUMP1:   
   ;Xuat
   MOV AH,9h
   LEA DX,HA1
   INT 21h  
   ;Nhap so dau tien
   MOV AH,1h  
   INT 21h   
   SUB AL,30h
   ;Dieu kien nhay
   CMP AL, 0h
   JB JUMP1    
   CMP AL, 9h 
   JA JUMP1
   
   MOV NUM1,AL 
   
JUMP2:   
   ;Xuat
   MOV AH,9h   
   LEA DX,HA2
   INT 21h
   ;Nhap so thu hai  
   MOV AH,1h
   INT 21h  
   SUB AL,30h 
   ;Dieu kien nhay
   CMP AL,0h
   JB JUMP2
   CMP AL,9h
   JA JUMP2
   
   MOV NUM2,AL
   
 
   
   ;Xuat
   MOV AH,9h
   LEA DX,HA3
   INT 21h
   ;Tinh tong
   MOV AL,NUM1
   MOV BL,NUM2
   ADD AL,BL
   
   MOV TONG,AL
      
   CMP TONG, 9h
   JA TONG2SO   
   
   ;Xuat tong 1 so tu 0 -> 9   
   ADD TONG, 30h
      
   MOV AH,2h
   MOV DL,TONG
   INT 21h 
   
   JMP KETTHUC
   
TONG2SO:
   ; Xuat ki tu 1 ra ngoai man hinh
   MOV AH, 2h
   MOV DL, '1'
   INT 21h
   
   ; Xuat phan du
   MOV AL, TONG
   SUB AL, 0Ah
   ADD AL, 30h
   
   MOV AH, 2h
   MOV DL, AL
   INT 21h     
   
KETTHUC:   
   MOV AH,4Ch
   INT 21h
END