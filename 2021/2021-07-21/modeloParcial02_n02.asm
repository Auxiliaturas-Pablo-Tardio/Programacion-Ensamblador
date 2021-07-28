;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modeloParcial02_n02.o modeloParcial02_n02.asm -l modeloParcial02_n02.lst
;link:	   -->> gcc -o modeloParcial02_n02 modeloParcial02_n02.o
;run:      -->> modeloParcial02_n02
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modeloParcial02_n02.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
m1 db "Introduzca elem y ponga 0 para finalizar",0
m2 db "su otro arreglo es =",0
m3 db "%lld,",0
fmt db "%lld",0
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resq 100 ; arreglo de numeros
b resq 100

segment .text 
 
global main 					
main:	




xor rbx,rbx
ciclo:
; Pedir elemento por elemento

PUSH rbx
		xor r10,r10
		imul rbx,8
		add r10,rbx
		add r10,a
		; a+(indice*8)
		push r10
		sub rsp,0x20
			mov rcx, fmt
			mov rdx,r10
			call scanf
		add rsp,0x20
		pop r10
		cmp qword[r10],0
		je salirEscaneo
POP rbx
inc rbx
JMP ciclo
salirEscaneo:

; RBX tiene el tamaño del vector -1
inc rbx
sub rsp,0x20
	mov rcx,a
	mov rdx,b
	mov r8,rbx
	call sacarCubosEnArreglo
add rsp,0x20

;imprimir un vector
xor rsi,rsi
cicloImprimir:
push rsi
	sub rsp,0x20
		mov rcx,m3
		mov rdx, [b+(rsi*8)]
		call printf
	add rsp,0x20
	
	cmp qword[b+rsi*8],0
	je salirImpresion
pop rsi
inc rsi
JMP cicloImprimir
salirImpresion:

ret
;---------------------------------------
;..........subrutinas....................	
sacarCubosEnArreglo:
	; param 1: arreglo1 direccion
	; param 2: arreglo2 direccion
	; param 3: tamaño valor
	mov r10,rcx ; param 1:
	
	mov rcx,r8 ;param 3: tamaño valor
	
	cicloCubo:
		xor rax,rax 
		mov rax,1 ;a=1 
			;a=a*n
		
		imul rax,[r10+((rcx-1)*8)] ;1 multi
		imul rax,[r10+((rcx-1)*8)] ;2 multi
		imul rax,[r10+((rcx-1)*8)] ; 3 
		mov [rdx+((rcx-1)*8)],rax  ;Pasar al nuevo vector
		
	loop cicloCubo

ret