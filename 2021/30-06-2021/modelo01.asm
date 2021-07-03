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
a dq 153,218064958,-499,5382525,50,-95,20,4592,0x123456789,-801,0
b dq 5093		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
promedio resq 1
residuo resq 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

xor r15,r15  ; registro que sera indice
xor r14,r14 ;registro para contar los elementos
xor rax,rax
xor rbx,rbx

ciclo:
	mov rbx,[a+r15*8];extraemos el elemento
	IMUL rbx,[b]
	add rax, rbx ;Acumulamos en rax
	inc r14
	inc r15
cmp rbx,0
JNZ ciclo
dec r15
;duplicamos el tamaño del numerador
cqo
;dividimos
IDIV r14
MOV [promedio],rax
mov [residuo],rdx	
ret
;---------------------------------------
;..........subrutinas....................	



