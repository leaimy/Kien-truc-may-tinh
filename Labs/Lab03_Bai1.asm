.MODEL SMALL
.DATA
       LOVELY DB 13,10,'NGUYEN THI HA DE THUONG $'
       MSG1 DB 13,10,'NHAP MOT KY TU: $'
       MSG2 DB 13,10,'Chao buoi sang ^_^$'
       MSG3 DB 13,10,'Chao buoi chieu *_*$'
       MSG4 DB 13,10,'Chao buoi toi @_@$'   
       KYTU DB ?
.CODE
   MOV AX,@DATA
   MOV DS,AX
   
   MOV AH,9h
   LEA DX,LOVELY
   INT 21h     
   INPUT:
   MOV AH,9h
   LEA DX,MSG1
   INT 21h
   
   MOV AH,1
   INT 21h 
   MOV KYTU,AL
   
   CMP KYTU,'S'
   JE SANG
   CMP KYTU,'s'
   JE SANG
   
   CMP KYTU,'C'
   JE CHIEU
   CMP KYTU,'c'
   JE CHIEU
   
   CMP KYTU,'T'
   JE TOI
   CMP KYTU,'t'
   JE TOI
   
   JMP INPUT
   
   
   SANG:
   MOV AH,9h
   LEA DX,MSG2
   INT 21h
   JMP KETTHUC
   
   CHIEU:
   MOV AH,9h
   LEA DX,MSG3
   INT 21h
   JMP KETTHUC
   
   TOI:
   MOV AH,9h
   LEA DX,MSG4
   INT 21h
   
   
   KETTHUC:
   MOV AH,4Ch
   INT 21h
END