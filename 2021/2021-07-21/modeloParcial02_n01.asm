;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modeloParcial02_n01.o modeloParcial02_n01.asm -l modeloParcial02_n01.lst
;link:	   -->> gcc -o modeloParcial02_n01 modeloParcial02_n01.o
;run:      -->> modeloParcial02_n01
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modeloParcial02_n01.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
m1 db "A= %lld",10,0
m2 db "B= %lld",10,0
m3 db "el mcd de A= %lld y B=%lld es %lld",10,0
m4 db "Introduzca A",10,0
m5 db "Introduzca B",10,0
fmtInt db "%lld",0		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resq 1
b resq 1

segment .text 
 
global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
; Pedir A
sub rsp,0x20
	mov rcx,m4
	call printf
add rsp,0x20 
; leer A

sub rsp,0x20
	mov rcx,fmtInt
	mov rdx,a
	call scanf
add rsp,0x20

; Pedir B
sub rsp,0x20
	mov rcx,m5
	call printf
add rsp,0x20 
; leer B

sub rsp,0x20
	mov rcx,fmtInt
	mov rdx,b
	call scanf
add rsp,0x20

; Armar la funcion

sub rsp,0x20
	mov rcx,[a]
	mov rdx,[b]
	call sacarMCD
add rsp,0x20
; se supone que hasta retorna en rax
push RAX ; salvar la variable

;Imprimir A
sub rsp,0x20
	mov rcx,m1
	mov rdx,[a]
	call printf
add rsp,0x20
 
;imprimir B
sub rsp,0x20
	mov rcx,m2
	mov rdx,[b]
	call printf
add rsp,0x20

pop rax ;recuperamos lo salvado
;imprimir total
sub rsp,0x20
	mov rcx,m3
	mov rdx,[a]
	mov r8,[b]
	mov r9,rax
	call printf
add rsp,0x20
	
ret
;---------------------------------------
;..........subrutinas....................	
sacarMCD: 
	; 1 : rcx =a
	; 2: rdx =b
; 1. sacara el menor
mov r12,rdx
cmp rcx,rdx
JL esAMenor
JMP esBMenor

esAMenor:
	mov r15,rcx
Jmp finComp
esBMenor:
	MOV r15,rdx
finComp:
; Hacer la division entre ambos

ciclo:
; division A entre Menor
mov rax,rcx
cqo
IDIV r15
; resultado en rax = cociente :rdx=residuo
cmp rdx,0
JE continuar
JMP decrementar
;division de B entre Menor
continuar:

mov rax, r12
cqo
IDIV r15
cmp rdx,0
JE encontroAmbos

decrementar: 
dec r15
Cmp r15,0
JNZ ciclo

encontroAmbos:
mov rax,r15 

ret 


