.MODEL  SMALL
.STACK 100h
.DATA
    MSG0 DB 13,10,'XUAT NGAY: $'
    MSG1 DB 13,10,'XUAT THANG: $'
    MSG2 DB 13,10,'XUAT NAM: $'
    
    NGAY DB ?
    THANG DB ?
    NAM DW ?
     
.CODE
    MOV AX,@DATA
    MOV DS,AX   
    
    MOV AH,2Ah
    INT 21h 
    
    MOV NGAY,DL
    MOV THANG,DH
    MOV NAM,CX
    
    
    LEA DX,MSG0
    CALL XUAT_CHUOI
    
    MOV BL,NGAY
    XOR BH,BH
    CALL XUAT_THAP_PHAN
    
    LEA DX,MSG1
    CALL XUAT_CHUOI
    
    MOV BL,THANG
    XOR BH,BH
    CALL XUAT_THAP_PHAN
    
    LEA DX,MSG2
    CALL XUAT_CHUOI  
    
    MOV BX,NAM
    CALL XUAT_THAP_PHAN
    

    MOV AH,4Ch
    INT 21h    
    
    XUAT_CHUOI PROC
        MOV AH,9h
        INT 21h
        RET
        XUAT_CHUOI ENDP 
    
    XUAT_THAP_PHAN PROC
        MOV AX,BX
        MOV BX,10
        XOR CX,CX
        
        XU_LY_STACK:
        XOR DX,DX
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX,0
        JA XU_LY_STACK
        
        PRINT:
        POP DX
        ADD DX,30h
        MOV AH,2h
        INT 21h
        
        LOOP PRINT 
        RET
        XUAT_THAP_PHAN ENDP
END