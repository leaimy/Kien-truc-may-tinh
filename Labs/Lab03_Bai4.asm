.MODEL SMALL
.DATA
  MSG DB 13,10,'NHAP MOT KY TU: $' 
  MSG1 DB 13,10,'NAM KY TU KE TIEP:$'
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
  ADD BL,1
  PRINT:
  MOV AH,2h
  MOV DL,BL
  INT 21h
  
  MOV DL,10
  INT 21h
  
  ADD BL,1  
 
  LOOP PRINT
  
  MOV AH,4Ch
  INT 21h
END
                            