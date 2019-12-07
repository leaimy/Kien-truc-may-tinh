.MODEL SMALL
.STACK 100h
.DATA
     MSG1 DB 13,10,'NHAP SO THU NHAT: $'
     MSG2 DB 13,10,'NHAP SO THU HAI: $'
     MSG3 DB 13,10,'TONG: $'
     MSG4 DB 13,10,'HIEU: $'
     MSG5 DB 13,10,'TICH: $'
     MSG6 DB 13,10,'THUONG: $' 
     
     NUM1 DW ?
     NUM2 DW ?

.CODE
     MOV AX,@DATA
     MOV DS,AX
     
; NHAP SO THU NHAT
     LEA DX,MSG1
     CALL NHAP_THAPPHAN 
     MOV NUM1,BX
     
; NHAP SO THU HAI
     LEA DX,MSG2
     CALL NHAP_THAPPHAN
     MOV NUM2,BX     

; XUAT TONG     
     LEA DX,MSG3
     CALL XUAT_CHUOI
     
     MOV AX,NUM1
     ADD AX,NUM2
     CALL XUAT_THAPPHAN

; XUAT HIEU
     LEA DX,MSG4
     CALL XUAT_CHUOI
     
     MOV AX,NUM1
     SUB AX,NUM2
     CALL XUAT_THAPPHAN
     
; XUAT TICH
     LEA DX,MSG5
     CALL XUAT_CHUOI  
     
     MOV AX,NUM1
     MUL NUM2
     CALL XUAT_THAPPHAN   
     
; XUAT THUONG
     LEA DX,MSG6
     CALL XUAT_CHUOI
     
     MOV AX,NUM1
     XOR DX,DX
     DIV NUM2
     CALL XUAT_THAPPHAN
     
     
; THOAT CHUONG TRINH           
     MOV AH,4Ch
     INT 21h 

; THU TUC     
     NHAP_THAPPHAN PROC 
        MOV AH,9h
        INT 21h
        
        MOV BX,0 
        
     INPUT:   
        MOV AH,7
        INT 21h
        
        CMP AL,0Dh
        JE BREAK    
        
        CMP AL,'0'
        JB INPUT  
        CMP AL,'9'
        JBE SO
        JMP INPUT
        
        
     SO:
        MOV CL,AL 
        
        MOV AH,2
        MOV DL,AL
        INT 21h
        
        SUB CL,30h
        MOV AX,BX
        MOV SI,10
        MUL SI    
        XOR CH,CH
        ADD AX,CX   
        MOV BX,AX
        JMP INPUT
        
     BREAK:
        RET
     NHAP_THAPPHAN ENDP   
     
     
     XUAT_CHUOI PROC
        MOV AH,9h
        INT 21h
                   
        RET
     XUAT_CHUOI ENDP
     
     
     XUAT_THAPPHAN PROC 
        MOV BX,10
        XOR CX,CX
     CHIA:    
        XOR DX,DX
        DIV BX   
        PUSH DX
        INC CX 
        
        CMP AX,0
        JA CHIA
        
     XULYSTACK:
        POP DX
        ADD DX,30h
        MOV AH,2
        INT 21h
        LOOP XULYSTACK
        
        RET
     XUAT_THAPPHAN ENDP
END