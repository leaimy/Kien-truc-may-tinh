.MODEL SMALL
.STACK 100h
.DATA
   MSG1 DB 13,10,'NHAP SO THAP LUC PHAN: $'
   MSG2 DB 13,10,'SO THAP LUC PHAN DA NHAP: $'


.CODE
   MOV AX,@DATA
   MOV DS,AX

; NHAP HEXA            
   MOV AH,9h
   LEA DX,MSG1
   INT 21h
   CALL NHAP_HEXA
   
; XUAT HEXA
   MOV AH,9h
   LEA DX,MSG2
   INT 21h   
   CALL XUAT_HEXA         

; THOAT CHUONG TRINH
   MOV AH,4Ch
   INT 21h     


; THU TUC
   
   NHAP_HEXA PROC 
    XOR BX,BX
    MOV CX,4
   
   INPUT:
    MOV AH,7
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
    MOV AH,2h
    MOV DL,AL
    INT 21h
    SUB AL,30h
    JMP LAP
   CHU: 
    MOV AH,2h
    MOV DL,AL
    INT 21h
    SUB AL,37h
    
   LAP:
    SHL BX,4
    XOR AH,AH
    OR BX,AX 
        
    LOOP INPUT
         
   BREAK:
    RET
   NHAP_HEXA ENDP  
   
   
   XUAT_HEXA PROC
    MOV CX,4
    
   OUTPUT:
    MOV DL,BH   ;B1: GAN BH CHO DL   
    SHR DL,4    ;B2: DICH PHAI DL 4 BIT
    CMP DL,9h   ;B3: DOI SO THANH KY TU
    JBE XUATSO
    JA XUATCHU    
    
   XUATSO:
    MOV AH,2
    ADD DL,30h
    INT 21h
    JMP LAPXUAT
    
   XUATCHU:
    MOV AH,2
    ADD DL,37h
    INT 21h
    
   LAPXUAT:        
    ROL BX,4       ;B4: XOAY TRAI BX 4 BIT
    
    LOOP OUTPUT    ;B5: LAP
    
    RET
   XUAT_HEXA ENDP
END