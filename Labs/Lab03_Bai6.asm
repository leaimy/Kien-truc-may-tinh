.MODEL SMALL
.DATA
  CHUOI DB 13,10,'NHAP MOT KY TU: $'
  CHUOI1 DB 13,10,'NAM KY TU DUNG TRUOC:$'
  CHUOI2 DB 13,10,'NAM KY TU DUNG SAU:$'
  
  KYTU DB ?
.CODE  
  MOV AX,@DATA
  MOV DS,AX
  
  MOV AH,9h          
  LEA DX,CHUOI
  INT 21h
  
  MOV AH,1
  INT 21h
  MOV KYTU,AL
  
  MOV AH,9h          
  LEA DX,CHUOI1
  INT 21h
  
  MOV CX,5
  MOV BL,KYTU
  SUB BL,5
  
  PRINT:    
  MOV AH,2h
  MOV DL,BL
  INT 21h
  
  ADD BL,1
  LOOP PRINT
  
  MOV AH,9h          
  LEA DX,CHUOI2
  INT 21h 
  
  MOV CX,5
  MOV BL,KYTU
  ADD BL,1
  
  PRINT1:    
  MOV AH,2h
  MOV DL,BL
  INT 21h
  
  ADD BL,1
  LOOP PRINT1

  MOV AH,4Ch
  INT 21h
END
