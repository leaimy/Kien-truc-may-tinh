.MODEL SMALL
.STACK 100h
.DATA
   MSG1 DB 13,10,'NHAP SO DAU TIEN: $'
   MSG2 DB 10,13,'NHAP SO THU HAI: $'
   
   RES1 DB 10,13, 'TONG $' 
   RES2 DB 10,13, 'HIEU: $'
   RES3 DB 10,13, 'TICH: $'
  
   
   DAU_AM DB ? 
   
   NUM1 DW ?
   NUM2 DW ?
   
.CODE
   MOV AX,@DATA
   MOV DS,AX

   LEA DX, MSG1
   CALL NHAP_THAP_PHAN
   MOV NUM1, CX
   
   LEA DX, MSG2
   CALL NHAP_THAP_PHAN
   MOV NUM2, CX
   
   LEA DX, RES1
   MOV AH, 9
   INT 21h
   
   MOV AX, NUM1
   MOV BX, NUM2
   ADD AX, BX
   
   CALL XUAT_THAP_PHAN
   
   
   LEA DX, RES2
   MOV AH, 9
   INT 21h
   
   MOV AX, NUM1
   MOV BX, NUM2
   SUB AX, BX
   
   CALL XUAT_THAP_PHAN
   
   
   LEA DX, RES3
   MOV AH, 9
   INT 21h
   
   MOV AX, NUM1
   MOV BX, NUM2
   MUL BX
   
   CALL XUAT_THAP_PHAN
   

; THOAT CHUONG TRINH   
   MOV AH,4Ch
   INT 21h 
   
; THU TUC

   NHAP_THAP_PHAN PROC   
                   
   PRINT: 
        MOV CX,0
        MOV DAU_AM, '+'
        
        MOV AH,9h
        INT 21h
        
        MOV AH, 1
        INT 21h
        
        CMP AL, '-'            
        JNE LOC_DK        
        MOV DAU_AM, '-'
                
               
    INPUT: 
        MOV AH,1
        INT 21h
        
        CMP AL,0Dh
        JE BREAK
    
    LOC_DK:    
        CMP AL,'0'
        JB PRINT 
        CMP AL,'9'
        JBE SO
        JMP PRINT
        
   SO:
        SUB AL,30h   
        MOV BL,AL
        MOV AX,CX 
        MOV SI,10
        MUL SI
        XOR BH,BH
        ADD AX,BX
        MOV CX,AX 
        JMP INPUT

        
   BREAK:     
        CMP DAU_AM, '-'
        JNE EXIT_1 
        NEG CX
        
        EXIT_1:
        RET
   NHAP_THAP_PHAN ENDP
   
   
   XUAT_THAP_PHAN PROC 
        CMP AX, 0
        JNS TIEPTUC
        
        MOV CX, AX
        
        MOV AH, 2
        MOV DL, '-'
        INT 21h
        
        NEG CX
        MOV AX, CX
        
    TIEPTUC:        
        MOV BX,10
        XOR CX,CX
        
   CHIA:
        XOR DX,DX
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX,0
        JA CHIA
   
   XU_LY_STACK:
        POP DX
        ADD DX,30h
        
        MOV AH,2h
        INT 21h
        
        LOOP XU_LY_STACK
    RET
   XUAT_THAP_PHAN ENDP
END