;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o 01.o 01.asm -l 01.lst
;link:	   -->> gcc -o 01 01.o
;run:      -->> 01
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 01.asm (nombre programa)

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

MOV AL,0B0001_0001
MOV AH,0B1110_1000
MOV BL,0B1100_0000
MOV BH,0B1011_1000


	
ret
;---------------------------------------
;..........subrutinas....................	



