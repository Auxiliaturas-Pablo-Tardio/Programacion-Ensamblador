;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo02.o modelo02.asm -l modelo02.lst
;link:	   -->> gcc -o modelo02 modelo02.o
;run:      -->> modelo02
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo02.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

a dd 1151,218064957,319,-2200,20764,9362202,-609,20,11990,-55

segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

promedio resd 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

XOR  RAX,RAX
XOR  RBX,RBX
XOR  RCX,RCX
XOR  RDX,RDX
xor  rsi,rsi
xor r8,r8
xor r9,r9
mov rbx,a ; direccion de a en rbx

mov rcx,10
ciclo:
;sacar el elemento actual
mov eax,[rbx+rsi]
; Preguntar si es el elemento un positivo

ROL eax,1       ;CMP EAX,0
				;JG esPositivo
; en el carry tenemos si es positivo o negativo
JNC esPositivo
;else
JMP esNegativo
esPositivo:
ror eax,1
add r8d,eax ; en r8 la suma
inc r9d ; en r9 n de elementos
esNegativo:

add rsi,4
loop ciclo

mov eax,r8d
cdq

idiv r9d

mov [promedio],eax

ret
;---------------------------------------
;..........subrutinas....................	



