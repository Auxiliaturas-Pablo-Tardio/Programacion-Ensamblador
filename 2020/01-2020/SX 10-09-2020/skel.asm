;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o skel.o skel.asm -l skel.lst
;link:	   -->> gcc -o skel skel.o
;run:      -->> skel
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: skel.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a db 10  ;byte
aword dw 0x400
adouble dd 0b100000
aquad dq 2000

		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
b resb 1
bword resw 1
bdouble resd 1
bquad resq 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
MOV AL, [a]
MOV AL, 8
MOV byte[a],8
mov AL,BL
MOV [a], AL

	
ret
;---------------------------------------
;..........subrutinas....................	



