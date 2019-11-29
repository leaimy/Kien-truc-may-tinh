.MODEL SMALL
.STACK 100h
.DATA
   MSG DB 13,10,'NHAP MOT CHUOI THAP LUC PHAN:$'
   MSG1 DB 13,10,'XUAT MOT CHUOI THAP LUC PHAN:$'
.CODE

   MOV AX,@DATA
   MOV DS,AX
   
   ;NHAP CHUOI HEXA
   MOV AH,9h
   LEA DX,MSG
   INT 21h
   
   XOR BX,BX
   MOV CX,4
INPUT:
   
   MOV AH,1
   INT 21h
   
   CMP AL,0Dh
   JE BREAK 
   
   CMP AL,'0'
   JB INPUT
   CMP AL, '9'
   JBE SO
   CMP AL, 'A'
   JB INPUT
   CMP AL, 'F'
   JBE CHU
   
   JMP INPUT
   
SO:
   SUB AL,30h
   JMP LAP
CHU:
   SUB AL,37h
LAP: 
   SHL BX,4
   OR BL,AL
   LOOP INPUT

BREAK:   
   ;XUAT CHUOI HEXA 
    MOV AH,9h
   LEA DX,MSG1
   INT 21h
   
   MOV CX,4     
   
OUTPUT:
   MOV DL,BH
   SHR DL,4
   CMP DL,9h
   JBE XUATSO
   JA  XUATCHU
   
XUATSO:
   MOV AH,2h
   ADD DL,30h
   INT 21h
   JMP LAP1

XUATCHU:
   MOV AH,2h
   ADD DL,37h
   INT 21h
   
LAP1: 
   ROL BX,4
   LOOP OUTPUT
KETTHUC:
   MOV AH,4Ch
   INT 21h

END