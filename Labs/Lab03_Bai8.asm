.MODEL SMALL
.DATA
  CHUOI DB 13,10,'NHAP MOT CHU THUONG (a-z): $'
  CHUOI1 DB 13,10,'CHU HOA TUONG UNG LA: $'
.CODE
  MOV AX,@DATA
  MOV DS,AX  
  
  
  PRINT:
  MOV AH,9h
  LEA DX,CHUOI
  INT 21h
  
  MOV AH,7h
  INT 21h   
  
  CMP AL,'a'
  JB PRINT
  CMP AL,'z'
  JA PRINT
  
  MOV BL,AL
  
  MOV AH,9h
  LEA DX,CHUOI1
  INT 21h 
  
  SUB BL,20h
  
  MOV AH,2h
  MOV DL,BL
  INT 21h

  MOV AH,4Ch
  INT 21h
END