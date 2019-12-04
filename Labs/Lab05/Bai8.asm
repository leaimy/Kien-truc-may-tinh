.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 10,13, 'GIO: $'
    MSG2 DB 10,13, 'PHUT: $'
    MSG3 DB 10,13, 'GIAY: $'
    
    GIO DB ?
    PHUT DB ?
    GIAY DB ?

.CODE 
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX     
    
    ; Lay gio he thong
    MOV AH,2Ch
    INT 21h
    
    MOV GIO,CH
    MOV PHUT,CL
    MOV GIAY,DH
    
    ; Xuat gio ra man hinh
    LEA DX,MSG1
    CALL XUAT_CHUOI 
    
    MOV BL,GIO
    XOR BH,BH
    CALL XUAT_THAP_PHAN
    
    ; Xuat phut ra man hinh
    LEA DX,MSG2
    CALL XUAT_CHUOI
    
    MOV BL,PHUT
    XOR BH,BH
    CALL XUAT_THAP_PHAN
    
    ; Xuat giay ra man hinh
    LEA DX,MSG3
    CALL XUAT_CHUOI
    
    MOV BL,GIAY
    XOR BH,BH
    CALL XUAT_THAP_PHAN
      
      
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h 
     
    ; ====================================================
    
    ; KHAI BAO THU TUC
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

