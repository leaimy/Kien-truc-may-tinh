.MODEL SMALL
.STACK 100h
.DATA
   MSG DB 13,10,'NHAP CHUOI KY TU:$'
   MSG1 DB 13,10,'CHUOI NGUOC:$'
.CODE
   MOV AX,@DATA
   MOV DS,AX
   
   CALL NTH_YEU_NTH
   
   ; Thoat chuong trinh
   MOV AH,4Ch
   INT 21h
   
   NTH_YEU_NTH PROC
       MOV AH,9h
       LEA DX,MSG
       INT 21h 
       XOR CX,CX  
     
    INPUT:   
       MOV AH,1
       INT 21h
       
       CMP AL,0Dh
       JE BREAK 
    
       XOR AH,AH
       PUSH AX   
       INC CX
       JMP INPUT
       
    BREAK:
       ; XUAT CHUOI DAO NGUOC
       MOV AH, 9
       LEA DX, MSG1
       INT 21h
       
    PRINT:
       MOV AH, 2
       POP DX
       INT 21h
       LOOP PRINT   
    RET
   NTH_YEU_NTH ENDP
END