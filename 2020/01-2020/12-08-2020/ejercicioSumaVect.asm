;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o ejercicioSumaVect.o ejercicioSumaVect.asm -l ejercicioSumaVect.lst
;link:	   -->> gcc -o ejercicioSumaVect ejercicioSumaVect.o
;run:      -->> ejercicioSumaVect
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ejercicioSumaVect.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

registro dd 6,1,7,0,6,4,9,4,7

hola equ 100
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

resultado resd 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

;1er Manera = hacer pares primero, impares luego, sumando indices
XOR EAX,EAX
MOV EAX,3
mov ebx,4

mov eax,hola

XOR RAX,RAX ; Acumulamos pares

XOR RCX,RCX ;acumular impares

XOR RBX,RBX ;REg base

Xor rdi,rdi ;Reg indices

MOV rbx, registro ;mov direcc
MOV rdi,0

add eax,[RBX+rdi]; i=0

add rdi,24

add eax,[RBX+rdi];i=6
add rdi,8

add eax,[RBX+rdi];i=6
;eax acumulado los pares





XOR RCX,RCX ;acumular impares
Xor rdi,rdi ;Reg indices

mov rdi, 4  ; indice 1

add ecx,[rbx+rdi]
add rdi,16 ; indice 5

add ecx,[rbx+rdi]
add rdi,8 ; indice 7

add ecx,[rbx+rdi]

;ecx, acumulado los impares
sub ecx,eax
; resultado := ecx;
mov [resultado],ecx


ret
;---------------------------------------
;..........subrutinas....................	



