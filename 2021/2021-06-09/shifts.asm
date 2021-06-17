;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o shifts.o shifts.asm -l shifts.lst
;link:	   -->> gcc -o shifts shifts.o
;run:      -->> shifts
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: shifts.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a dq -1000
b dq +2000
c dq -3000
d dq +4000		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
x resq 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
mov rbx,[b]
neg rbx
mov rax,[a]
shl rax,5
mov rcx,[c]
sub rcx,[d]
add rbx,20
sub rax,10
sar rcx,2
;or rax,rcx
;and rbx,rax
and rax,rbx
or rax,rcx
mov [x],rax

	
ret
;---------------------------------------
;..........subrutinas....................	



