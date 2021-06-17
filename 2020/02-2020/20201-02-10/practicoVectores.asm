;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
registro dw 2,1,9,0,6,5,9,8,7
miConst equ 10 
indicesPermitidos db 1,3,7,8 

segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

resultado resw  1
segment .text 
xor rcx,rcx
xor rax,rax
xor rbx, rbx
xor r14,r14
xor r15,r15
mov rcx,9
mov rbx,registro
ciclo:
;
	add r15w,miConst

	;llamada a la subrutinas
	push rcx
	mov rcx,r14
	mov rdx,indicesPermitidos
	CALL verificarIndice ;; return RAX -TRUE-FALSE  =1,0
	pop rcx
	cmp rax,1 
	JE esElIndice 
	JMP fin
	
	esElIndice:
	
	add r15w,[rbx+r14]
	; vector[i]+miConst
	fin:
	add r14,2

loop ciclo

mov [resultado],r15w
global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones


	
ret


;---------------------------------------
;..........subrutinas....................
;param 1 : rcx desplazzmiento
;param 2: rdx direccion del vector de indicesPermitidos
verificarIndice:
;transformacion de desplazamiento a indice
push rdx
mov rax,rcx ; 2 -->1 ,4--->2
mov rdx,2
cqo 
idiv rdx

; rax resultado de la division


pop rdx
mov rcx,4
ciclo:

cmp [rdx+(ciclo-1)],rax
je retornarTrue

loop ciclo
mov rax,0
jmp finFuncion
retornarTrue:
mov rax,1

finFuncion:
ret



