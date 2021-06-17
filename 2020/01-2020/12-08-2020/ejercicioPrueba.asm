;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o ejercicioPrueba.o ejercicioPrueba.asm -l ejercicioPrueba.lst
;link:	   -->> gcc -o ejercicioPrueba ejercicioPrueba.o
;run:      -->> ejercicioPrueba
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ejercicioPrueba.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

arreglo dd  2,1,7,0,6,4,9,5,7	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

mov rbx,arreglo

;1er Manera = hacer pares primero, impares luego,
; sumando
xor rax,rax
xor rbx,rbx
xor rdi,rdi
xor rcx,rcx

mov rbx, arreglo
mov rdi, 0

add eax,[rbx+rdi] ; i=0
add rdi, 24
add eax,[rbx+rdi]
add rdi,8
add eax,[rbx+rdi]

mov rdi,4
add ecx,[rbx+rdi] ; i=0
add rdi, 16
add ecx,[rbx+rdi]
add rdi,8
add ecx,[rbx+rdi]

sub eax,ecx

;2da Manera =hacerlo todo junto, sumando

;3ra manera = hacerlo directo 

;4ta hacerlo alreves
	
ret
;---------------------------------------
;..........subrutinas....................	



