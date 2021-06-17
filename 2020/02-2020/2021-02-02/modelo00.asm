;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo00.o modelo00.asm -l modelo00.lst
;link:	   -->> gcc -o modelo00 modelo00.o
;run:      -->> modelo00
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo00.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a dq 12,-25,14,-84,99
k EQU 3
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

b RESQ 5 
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

XOR RAX,RAX
XOR RBX,RBX
XOR RCX,RCX ; usado en el loop
XOR RDX,RDX
; copiamos a un registro la direccion del vector
MOV RBX,a
; copiamos a un registro la direccion del vector b

mov r10,b

mov rcx,5

mov r9,k

inicioDoWhile:
mov r8,[rbx] ;mov r8,[a]
; elemento del vector en r8
mov rax,r8
cqo ; instruccion para ampliar rax a rdx:rax


IDIV r9
; el resultado del div esta en rax
; el mod en rdx NO LO NECESITAMOS
mov [R10],rax


add r10,8
add rbx,8

loop inicioDoWhile



ret
;---------------------------------------
;..........subrutinas....................	



