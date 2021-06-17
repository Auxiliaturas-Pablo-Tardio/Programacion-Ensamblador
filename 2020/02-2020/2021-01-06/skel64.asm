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
registro dd 218064957
nombreapellidos db "Pablo Tardio",0
carrera dw 1874
fechaNac dd 20073000
carnet dd 7332202
edad db 20
email db "pepe2@MAIL.COM",0
		
segment .bss 
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones


	
ret
;---------------------------------------
;..........subrutinas....................	



