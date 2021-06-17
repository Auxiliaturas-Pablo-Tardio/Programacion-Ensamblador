;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o EjemploVaribles.o EjemploVaribles.asm -l EjemploVaribles.lst
;link:	   -->> gcc -o EjemploVaribles EjemploVaribles.o
;run:      -->> EjemploVaribles
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: EjemploVaribles.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
;nombreDeVariable D=DEFINIR Letra=tamaño de variable    Valor
varByte db 255
varWord dw 65535
varDouble dd 217080801
varQuead dq 1520 
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
reservarByte resb 1
reservarWord resW 1
varC resd 1
varD resq 1
vector resq 4  ;Vector

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
mov byte[reservarByte],255

	
ret
;---------------------------------------
;..........subrutinas....................	



