;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o EjercicioJMPS.o EjercicioJMPS.asm -l EjercicioJMPS.lst
;link:	   -->> gcc -o EjercicioJMPS EjercicioJMPS.o
;run:      -->> EjercicioJMPS
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: EjercicioJMPS.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a db 100
b db 128
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar



segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
xor rcx,rcx
xor rax,rax
mov al, [a]
cmp al,[b]
JG esMayor
JMP noEsMayor
esMayor:
add cl,[a]
add cl,[b]
JMP finIf
noEsMayor:
SUB al,[b]
mov cl,al

finIf:

	
ret
;---------------------------------------
;..........subrutinas....................	



