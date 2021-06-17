;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o opArit.o opArit.asm -l opArit.lst
;link:	   -->> gcc -o opArit opArit.o
;run:      -->> opArit
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: opArit.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a db 100
b db 200
m db 0xff

segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

c resb 1
x resw 1	
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;ADD
xor rax,rax

mov al,[a]
add al,[b]
mov [c],al

mov bl,[b]
sub bl,[a]
mov [c],bl

mov al,[a]
add al,[b]

mov [x],al
adc byte[x+1],0

inc byte[m]
dec byte[m]
	
ret
;---------------------------------------
;..........subrutinas....................	



