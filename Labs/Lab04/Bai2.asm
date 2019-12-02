.MODEL SMALL
.STACK 100h
.DATA
  CHUOI1 DB 13,10,'NHAP MOT KY TU: $'
  CHUOI2 DB 13,10,'KY TU DA NHAP LA CHU^_^$'
  CHUOI3 DB 13,10,'KY TU DA NHAP LA SO^_^$'
  CHUOI4 DB 13,10,'KY TU DA NHAP KHAC CHU/SO*_*$'

.CODE
  MOV AX,@DATA
  MOV DS,AX
  
  CALL HADETHUONG
  
KETTHUC:
  MOV AH,4Ch
  INT 21h
  
  HADETHUONG PROC
      MOV AH,9h
      LEA DX,CHUOI1
      INT 21h
      
      MOV AH,1
      INT 21h
      
      CMP AL,'0'
      JB KHONG
      CMP AL,'9'
      JBE SO
      CMP AL,'A'
      JB KHONG
      CMP AL,'Z'
      JBE CHU
      CMP AL,'a'
      JB KHONG
      CMP AL,'z'
      JBE CHU
      
    KHONG:
      MOV AH,9h
      LEA DX,CHUOI4
      INT 21h
      JMP KETTHUC
    SO:
      MOV AH,9h
      LEA DX,CHUOI3
      INT 21h  
      JMP KETTHUC
    CHU:
      MOV AH,9h
      LEA DX,CHUOI2
      INT 21h
      
      RET    
  HADETHUONG ENDP

END