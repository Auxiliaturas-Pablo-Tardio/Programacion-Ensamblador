;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo03.o modelo03.asm -l modelo03.lst
;link:	   -->> gcc -o modelo03 modelo03.o
;run:      -->> modelo03
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo03.asm (nombre programa)

extern printf, scanf,strlen,gets		

segment .data
;aqui se declaran variables inicializadas
m1 db "Ingresar la cadena de caracteres (maximo 100 caracteres)",0
m2 db "la cadena tiene un conjunto Balanceado",0
m3 db "la cadena NO tiene un conjunto Balanceado",0
fmt db "%s",0	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
cad resb 100

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

sub rsp,32 ; espacio sombra
	mov rcx,m1
	call printf
add rsp,32 ;

; escanear el mensaje

sub rsp,32

	mov rcx,cad
	call gets
add rsp,32

sub rsp,32
	mov rcx,cad
	call strlen ; rax lenth de la cadena
add rsp,32

sub rsp,32
	mov rcx,cad
	mov rdx,rax
	call isBalanceado
add rsp,32
; Rax 
CMP RAX,1
;Es balanceado
JE mBal
JMP mNoBal
mBal:
sub rsp,32
	mov rcx,m2
	mov rdx,rax
	call printf
add rsp,32
JMP finMain
mNoBal:
sub rsp,32
	mov rcx,m3
	mov rdx,rax
	call printf
add rsp,32	
finMain:
ret
;---------------------------------------
;..........subrutinas....................	
isBalanceado:
	mov [rsp+8],rcx  ; primer par
	mov [rsp+16],rdx ; segundo par
	
	mov r12,rcx ; direccion de la cadena
	xor r13,r13
	xor r15,r15 ; es el contador  de parentesis
	mov rcx,rdx ; tamaño de la cadena
	ciclo:
	
		mov r13b,[r12] ; extraemos el caracter actual
		cmp r13,40
		JE parentesisAbierto
		JMP compParentCerrado
		parentesisAbierto:
			inc r15
		JMP finCiclo
		compParentCerrado:
		cmp r13,41
		JE esParentesisAbierto
		JMP finCiclo
		esParentesisAbierto:
		
			dec r15
		;; Preguntar caso especial
		
			CMP r15,-1
			JE errorParentesis
		 
		
		finCiclo:
	inc r12
	loop ciclo
cmp r15,0
JE siSeBalanceo

errorParentesis:
mov rax,0
jmp finBalanceo
siSeBalanceo:
mov rax,1
finBalanceo:	
ret



