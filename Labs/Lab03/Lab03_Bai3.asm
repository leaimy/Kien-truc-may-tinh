.MODEL SMALL
.DATA
   MSG DB 13,10,'TAT CA CHU HOA TRONG BO MA ASCII LA:',13,10, '$' 
   ENDL DB 10,13, '$'                                             
   
.CODE
   MOV AX,@DATA
   MOV DS,AX
  
   ; CACH 1: DUNG LENH NHAY
   MOV AH,9h
   LEA DX,MSG
   INT 21h
   
   MOV AL,'A'
   
   PRINT:
   MOV AH,2h
   MOV DL,AL
   INT 21h
    
   ADD AL,1
   CMP AL,'Z'
   JBE PRINT
   
   MOV AH, 9
   LEA DX, ENDL
   INT 21h
   
   ; CACH 2: DUNG VONG LAP  
   MOV CX, 26
   MOV AL, 'A'
   
   PRINT_LOOP:
       MOV AH, 2
       MOV DL, AL
       INT 21h
       
       ADD AL, 1
       
       LOOP PRINT_LOOP
   
   MOV AH,4Ch
   INT 21h

END