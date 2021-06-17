;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o prueba.o prueba.asm -l prueba.lst
;link:	   -->> gcc64 -o prueba prueba.o
;run:      -->> prueba
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: prueba.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

	x dq -80538738812075974
	y dq 80435758145817515
	z dq 12602123297335631
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
	

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
PUSH qword[x]
call elevar
add esp,8
MOV R8,RAX
MOV R9,RDX

PUSH qword[y]
call elevar
add esp,8
MOV R10,RAX
MOV R11,RDX

PUSH qword[z]
call elevar
add esp,8	
MOV R12,RAX
MOV R13,RDX



ADD R8,R10 
ADC R9,R11

;XOR RAX,RAX,
;XOR RBX,RBX
;mov AL,255
;MOV BL,255
;ADD AL,BL
;ADC AH,BH

ADD R8,R12
ADC R9,R13
 
ret
;---------------------------------------
;..........subrutinas....................	

elevar:
push rbp
mov rbp,rsp

mov rcx,3
;base ebp+16
MOV RBX,[RBP+16]
MOV RAX,1
ciclo:

IMUL RBX

loop ciclo

leave 
ret

