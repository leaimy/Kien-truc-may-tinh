.MODEL SMALL
.STACK 100h
.DATA
   MSG DB 13,10,'NHAP SO THAP PHAN: $' 
   MSG1 DB 13,10,'XUAT SO THAP PHAN: $'
   TONG DW ?   
   SO DB ?
.CODE
   MOV AX,@DATA
   MOV DS,AX

; NHAP MOT SO THAP PHAN
RESET:   
   MOV AH,9h
   LEA DX,MSG
   INT 21h
   
   MOV TONG,0

INPUT:   
   MOV AH,1
   INT 21h 
   
   CMP AL,0Dh
   JE  BREAK
   
   CMP AL,'0'
   JB RESET
   CMP AL,'9'
   JA RESET
   
   SUB AL,30h
   
   MOV CL,AL 
   XOR CH,CH
   
   MOV AX,TONG
   MOV DX,10
   MUL DX ; => AX = AX * DX=TONG *10
   ADD AX,CX 
   MOV TONG,AX
<<<<<<< HEAD
   JMP INPUT

BREAK:   
; XUAT MOT SO THAP PHAN
   MOV AH,9h
   LEA DX,MSG1
   INT 21h
   
   MOV AX,TONG
   MOV BX,10 
   XOR CX,CX
   
XULY_STACK:
   XOR DX, DX   
   DIV BX ; => AX=AX/BX=TONG/10
   
   PUSH DX
   INC CX
   
   CMP AX,0
   JA XULY_STACK
   
PRINT:
   POP DX
   ADD DX,30h
   MOV AH,2h
   INT 21h     
   LOOP PRINT
   
      
=======
   JMP INPUT      
>>>>>>> 3639975a398ca049773291a1bb4783bc79e2de8e
   
KETTHUC:
   MOV AH,4Ch
   INT 21h
END