;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

N dq 217060504
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

calculo1 resq 1
calculo2 resq 1
resultado resq 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

;Parte izquierda = sumatoria



;loop = dec rcx -> JNZ etiqueta
;suma
xor rax,rax
;contador
xor rbx,rbx

mov rbx, 1

mov rcx,[N]
ciclo:

add rax,rbx ; suma=contador+suma
add rbx,1 ;o inc rbx

loop ciclo


;fin de ciclo

mov [calculo1],rax
;resultado1 = sumatoria 

;parte derecha
;N2 =rax
mov rax,[N]
INC rax ;N+1

;N3 =rbx
mov rbx,[N]

IMUL rbx ; N(N+1) = rax:rdx

Mov r8,2

IDIV R8

mov [calculo2],rax


;Haciendo la demostracion 

mov eax, [calculo1]

;haciendo la resta
CMP eax,[calculo2]
;CONDICION
JE esIgual
JMP noSonIgual

esIgual:
mov qword[resultado],0
not qword[resultado]
JMP fin
noSonIgual:
mov qword[resultado],0


fin:
ret
;---------------------------------------
;..........subrutinas....................	




