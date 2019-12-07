.MODEL SMALL
.STACK 100h
.DATA
   MSG1 DB 13,10,'NHAP SO NHI PHAN: $'
   MSG2 DB 13,10,'SO NHI PHAN DA NHAP: $'

.CODE
   MOV AX,@DATA
   MOV DS,AX

; NHAP NHI PHAN   
   MOV AH,9h
   LEA DX,MSG1
   INT 21h
   CALL NHAP_NHIPHAN   
   
; XUAT NHI PHAN   
   MOV AH,9h
   LEA DX,MSG2
   INT 21h
   CALL XUAT_NHIPHAN          
             
; THOAT CHUONG TRINH   
   MOV AH,4Ch
   INT 21h 
   
      
; THU TUC

   NHAP_NHIPHAN PROC    
    XOR BX,BX    
    MOV CX,16
   INPUT:
    MOV AH,7
    INT 21h
    
    CMP AL,0Dh
    JE BREAK 
    
    CMP AL,'0'
    JB INPUT
    CMP AL,'1'
    JA INPUT
    
    MOV AH,2
    MOV DL,AL
    INT 21h
    SUB AL,30h
    SHL BX,1
    OR BL,AL 
    
    LOOP INPUT    
    
   BREAK:
    RET
   NHAP_NHIPHAN ENDP
   
   
   XUAT_NHIPHAN PROC
    MOV CX,16  
    
   OUTPUT:
    ROL BX,1
    JC MOT
    JNC KHONG
    
    
   MOT:
    MOV AH,2
    MOV DL,'1'
    INT 21h
    JMP LAP
   KHONG:
    MOV AH,2
    MOV DL,'0'
    INT 21h
   LAP:  
    LOOP OUTPUT 
    RET
   XUAT_NHIPHAN ENDP    
END