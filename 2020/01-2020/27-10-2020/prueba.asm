;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf,gets,strlen, gets			

segment .data
;aqui se declaran variables inicializadas
m1 db "hola",0
formato db "%s",0		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

cadena resb 100
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

add rsp,0x20
mov rcx,formato
mov rdx,cadena
call scanf
sub rsp,0x20

sub rsp, 0x20
mov rcx, cadena		
call gets
add rsp, 0x20	
ret
;---------------------------------------
;..........subrutinas....................	



