;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o vectores.o vectores.asm -l vectores.lst
;link:	   -->> gcc -o vectores vectores.o
;run:      -->> vectores
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: vectores.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
registro dw 2,1,9,0,6,4,8,5,7
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
resultado resw 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

mov rax,registro
add word[rax+2],10
mov bx,[rax+2]
add [resultado],bx


add word[rax+6],10
mov bx,[rax+6]
add [resultado],bx


add word[rax+14],10
mov bx,[rax+14]
add [resultado],bx


add word[rax+16],10
mov bx,[rax+16]
add [resultado],bx
	
ret
;---------------------------------------
;..........subrutinas....................	



