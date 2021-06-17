;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o 06.o 06.asm -l 06.lst
;link:	   -->> gcc -o 06 06.o
;run:      -->> 06
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 06.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

MOV AL,-10
 MOV BL,-5
 MOV CL,-7
 MOV DL,-2
 MOV RAX,-1
 MOV RBX,RAX
 MOV EAX,EBX

	
ret
;---------------------------------------
;..........subrutinas....................	



