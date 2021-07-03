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
a dd 12,-25,14,-84,99	
k dd 3	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
b resd 5
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;Base+ indice
;[registroBase(rbx,rbp)+registro indices (rsi,rdi));

xor rbx,rbx
xor rsi,rsi ;indice
xor r12,r12
mov r12,a ; registro de direccion de vector
mov rbx,b 
mov rcx,5
ciclo:
	mov eax,[r12+rsi];extraemos elemento
	cdq ;dividir
	IDIV dword[k] ; eax: cociente  edx residuo ;; byte = al ah
	mov [rbx+rsi],eax
	add rsi,4 ;Incrementamos indice
loop ciclo

ret
;---------------------------------------
;..........subrutinas....................	



