;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

N dq 217024051		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

calculo1 resq 1
calculo2 resq 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

xor rax,rax

 mov edx,0xffff
mov rax,5

mov rbx, 3

imul ebx
	
ret
;---------------------------------------
;..........subrutinas....................	



