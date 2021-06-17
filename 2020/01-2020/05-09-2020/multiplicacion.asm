;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o multiplicacion.o multiplicacion.asm -l multiplicacion.lst
;link:	   -->> gcc -o multiplicacion multiplicacion.o
;run:      -->> multiplicacion
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: multiplicacion.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
ab db 100
aw dw 65535
ad dd 3005000
aq dq 50000005444
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;mul byte

mov al,100
mul byte[ab]
;mul word

mov ax,100
mul word[aw]
;mul double

mov eax,100
mul dword[ad]
;mul quad

mov rax,100
mul qword[aq]

;imul 1 operando
mov al,100
imul byte[ab]
;mul word

mov ax,100
imul word[aw]
;mul double

mov eax,100
imul dword[ad]
;mul quad

mov rax,100
imul qword[aq]

; imul de 2 operandos

mov bx,400
imul bx,[aw]
	
; imul de 3 operandos

imul ebx,[ad],2
ret
;---------------------------------------
;..........subrutinas....................	



