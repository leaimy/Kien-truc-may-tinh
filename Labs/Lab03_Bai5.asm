.MODEL
.DATA
  MSG DB 13,10,'NHAP MOT KY TU:$'
  MSG1 DB 13,10,'NAM KY TU DUNG TRUOC: $'
  KYTU DB ?
  
.CODE
  MOV AX,@DATA
  MOV DS,AX
  
  MOV AH,9h
  LEA DX,MSG
  INT 21h
  
  MOV AH,1
  INT 21h
  MOV KYTU,AL
  
  MOV AH,9h
  LEA DX,MSG1
  INT 21h
  
  MOV CX,5
  MOV BL,KYTU
  SUB BL,5
  
  PRINT: 
  MOV AH,2h
  MOV DL,BL
  INT 21h
  
  MOV DL,0Ah
  INT 21h 
  INC BL
  
  LOOP PRINT

  MOV AH,4Ch
  INT 21h
END