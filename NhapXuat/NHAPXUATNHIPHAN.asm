.MODEL SMALL
.STACK 100h
.DATA
   MSG DB 13,10,'NHAP MOT DAY NHI PHAN:$'
   MSG1 DB 13,10,'XUAT DAY NHI PHAN:$'
.CODE   
   MOV AX,@DATA
   MOV DS,AX     
   
   ; Nhap chuoi nhi phan
   XOR BX,BX
        
   MOV AH,9h
   LEA DX,MSG
   INT 21h
   
   MOV CX,16  
    
INPUT:
   MOV AH,1
   INT 21h
     
   CMP AL,13
   JE PRINT
   
   SUB AL,30h
   SHL BX,1
   OR BL,AL
   
   LOOP INPUT
   
   ; Xuat day nhi phan 
PRINT:           
   MOV AH,9h
   LEA DX,MSG1
   INT 21h  
   
   MOV CX,16
OUTPUT:
   ROL BX,1
   JC MOT
   JNC KHONG

MOT:
   MOV AH,2h
   MOV DL,'1'
   INT 21h 
   JMP LAP
KHONG:
   MOV AH,2h
   MOV DL,'0'   
   INT 21h
LAP:  
   LOOP OUTPUT
   
KETTHUC:    
   MOV AH, 1
   INT 21h
   
   MOV AH,4Ch
   INT 21h
END