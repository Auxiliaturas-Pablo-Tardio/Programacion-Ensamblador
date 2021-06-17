;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o skel64.o skel64.asm -l skel64.lst
;link:	   -->> gcc -o skel64 skel64.o
;run:      -->> skel64
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: skel64.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a db 255
b dw 65500
c dd 50000000
d dq 90000
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
 
ar resb 1
br resw 1
cr resd 1
dr resq 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

mov ax,[a]
mov [a],ax
mov ax,bx
mov word[a],100
mov bx,100

	
ret
;---------------------------------------
;..........subrutinas....................	



