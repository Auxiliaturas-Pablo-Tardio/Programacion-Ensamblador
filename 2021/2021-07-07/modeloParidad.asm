;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modeloParidad.o modeloParidad.asm -l modeloParidad.lst
;link:	   -->> gcc -o modeloParidad modeloParidad.o
;run:      -->> modeloParidad
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modeloParidad.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
arreglo db 5,10,4,5,3,0
	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
paridad resb 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
; Base + indice 
; registroBase (RBX, rbp) + indice( rsi,rdi)
xor rbx,rbx
mov rbx,arreglo; direccion
xor rsi,rsi ;indice
xor rdx,rdx ; elemento actual
xor rax,rax ;suma de bits  
ciclo:

	mov dl,[rbx+rsi];extraigo el elemento
	mov rcx,8
	;Subciclo para acumular bits de mi elemento actual
	subCiclo:
		mov r12b,dl ; registro auxiliar para el and
		and r12b,1
		add al,r12b
		ror dl,1
		
	
	loop subCiclo
	inc rsi
	
	cmp dl,0 ; cl==0?
JZ salir
JMP ciclo
	
salir:
;como ya sali del ciclo verifico si el numero de bits es para

shr al,1 
jc esImpar
JMP esPar
esImpar:
mov byte[paridad],0
jmp finTotal
esPar: 
mov byte[paridad],1
finTotal:
ret
;---------------------------------------
;..........subrutinas....................	



