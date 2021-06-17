;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o 03.o 03.asm -l 03.lst
;link:	   -->> gcc -o 03 03.o
;run:      -->> 03
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 03.asm (nombre programa)

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
MOV AX,0B0001_0001
 MOV CX,0B1110_1000
 MOV DX,0B1100_0000
 MOV BH,0B1011_1000


	
ret
;---------------------------------------
;..........subrutinas....................	



