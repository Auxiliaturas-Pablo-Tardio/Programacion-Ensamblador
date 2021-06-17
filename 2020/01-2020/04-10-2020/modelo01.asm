;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo01.o modelo01.asm -l modelo01.lst
;link:	   -->> gcc -o modelo01 modelo01.o
;run:      -->> modelo01
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo01.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
var dd 311223344H
formato db "%lld",0
m1 db "El mcd de A y B ES %lld",0	
	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resq 1
b resq 1
resultado resq 1


section .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rdx,rdx

sub rsp,0x20
	 
mov rdx,a
mov rcx,formato		
call scanf
add rsp,0x20

sub rsp,0x20
mov rdx,b
mov rcx,formato	
call scanf
add rsp,0x20

sub rsp,0x20

mov rdx,[a]
mov rcx,[b]
call mcd
add rsp,0x20

sub rsp,0x20
mov rdx,rax
mov rcx,m1
call printf

add rsp,0x20

ret
;---------------------------------------
;..........subrutinas....................	

mcd:
; menor de dos numeros
mov r8,rcx ;b
mov r9,rdx ;a
cmp r9,r8
JL aEsMenor
JMP bEsMenor
aEsMenor:

mov rcx,r9
JMP fin
bEsMenor:
mov rcx,r8
; rcx ya esta con b
fin:
mov rbx,1 ;contador
ciclo:
mov rax,r8 ; b
cqo 
idiv rbx
mov r11,rdx ; primer mod
 
 mov rax,r9
 cqo
 idiv rbx
 mov r12,rdx ;segundo mod
 
 cmp r11,r12
 JZ guardamosMCD
 JMP finalmcd
	guardamosMCD:
	mov r10,rbx 
 finalmcd:
 
 inc rbx
loop ciclo

mov rax,r10

ret


