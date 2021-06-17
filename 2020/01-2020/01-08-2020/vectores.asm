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
a dw 800
vector db 2,4,6,8,10
vectorWord dw 2,4,6,8,10
vectorDouble dd 2,4
segment .bss
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

mov rbx,vectorWord 
mov rdx,0
;manejamos el vector
;sumar todos los elementos
;sin while
;ax=0
add ax, [vectorWord+rdx*2] ;ax= [a+0*2]
inc rdx

add ax, [vectorWord+rdx*2] ;ax= [a+1*2]
inc rdx

add ax, [vectorWord+rdx*2] ;ax= [a+2*2]
inc rdx

add ax, [vectorWord+rdx*2] ;ax= [a+3*2]
inc rdx

ret

	
ret
;---------------------------------------
;..........subrutinas....................	



