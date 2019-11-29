.MODEL SMALL
.DATA   
   MSG DB 10,13,'NHAP MOT KY TU: $'   
   MSG1 DB 10,13,'Ky tu da nhap khac chu/so$'
   MSG2 DB 10,13,'Ky tu da nhap la so$'
   MSG3 DB 10,13,'Ky tu da nhap la chu$'
   MSG4 DB 10,13,'Thoat chuong trinh^_^$'
   KYTU DB ?
.CODE
  MOV AX,@DATA
  MOV DS, AX
  
  PRINT:
  MOV AH,9h
  LEA DX,MSG
  INT 21h
  
  MOV AH,1
  INT 21h
  MOV KYTU,AL
  
  CMP KYTU,1Bh
  JE THOAT
  
  CMP KYTU,'0'
  JB KHAC
  CMP KYTU,'9'
  JBE SO
  CMP KYTU,'A'
  JB KHAC
  CMP KYTU,'Z'
  JBE CHU
  CMP KYTU,'a'
  JB KHAC
  CMP KYTU,'z'
  JBE CHU 
  
  
  KHAC:
  MOV AH,9h
  LEA DX,MSG1
  INT 21h
  JMP PRINT  
  
  SO:
  MOV AH,9h
  LEA DX,MSG2
  INT 21h
  JMP PRINT
  
  CHU:
  MOV AH,9h
  LEA DX,MSG3
  INT 21h
  JMP PRINT
  
  THOAT:  
  MOV AH,9h
  LEA DX,MSG4
  INT 21h
  
  MOV AH,4Ch
  INT 21h
END