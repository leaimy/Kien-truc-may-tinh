.MODEL SMALL
.STACK 100h
.DATA
   CHUOI1 DB 13,10,'NHAP CHUOI HEXA: $'
   CHUOI2 DB 13,10,'XUAT KY TU DAU TIEN CUA CHUOI HEXA: $'

.CODE
   MOV AX,@DATA
   MOV DS,AX
; NHAP CHUOI HEXA
   XOR BX,BX 
   MOV CX,4
   
   LEA DX,CHUOI1
   CALL XUAT_CHUOI
INPUT:   
   MOV AH,1
   INT 21h
   
   CMP AL,0Dh
   JE BREAK
   
   CMP AL,'0'
   JB INPUT
   CMP AL,'9'
   JBE SO
   CMP AL,'A'
   JB INPUT
   CMP AL,'F'
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
  

; XUAT KY TU DAU TIEN CUA CHUOI HEXA
BREAK: 
   LEA DX,CHUOI2
   CALL XUAT_CHUOI 
   
   MOV CX,1
   
OUTPUT:
   MOV DL,BH
   SHR DL,4
   CMP DL,9h
   JBE XUATSO
   JA XUATCHU
   
XUATSO:
   MOV AH,2h
   ADD DL,30h
   INT 21h
   JMP LAPXUAT
   
XUATCHU:
   MOV AH,2h
   ADD DL,37h
   INT 21h
   
LAPXUAT:
   ROL BX,4
   LOOP OUTPUT    
   
KETTHUC:   
   MOV AH,4Ch
   INT 21h 
   
   XUAT_CHUOI PROC 
    MOV AH,9h
    INT 21h
    
    RET
   XUAT_CHUOI ENDP
END