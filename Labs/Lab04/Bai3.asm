.MODEL SMALL
.STACK 100h
.DATA
  MSG DB 13,10,'NHAP MOT CHU THUONG (a-z): $'
  MSG1 DB 13,10,'CHU HOA TUONG UNG LA: $'

.CODE
  MOV AX,@DATA
  MOV DS,AX 

  CALL HA 
  
  MOV AH,4Ch
  INT 21h  
  
  HA PROC
     PRINT:  
      MOV AH,9h
      LEA DX,MSG
      INT 21h
      
      MOV AH,1
      INT 21h
      
      CMP AL,'a'
      JB PRINT
      CMP AL,'z'
      JA PRINT
      
      MOV BL,AL
      MOV AH,9h
      LEA DX,MSG1
      INT 21h
      
      SUB BL,20h
      
      MOV AH,2
      MOV DL,BL
      INT 21h
    RET
    HA ENDP
  
 
END