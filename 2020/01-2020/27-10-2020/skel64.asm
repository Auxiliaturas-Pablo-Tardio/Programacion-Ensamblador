;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf,gets,strlen		

segment .data
;aqui se declaran variables inicializadas
m1 db  "Introduzca la cadena a analizar",0
m2 db "la cadena introducida NO es un correo",0
m3 db "la cadena introducida SI es un correo",0
fmt db "%s",0
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

correo resb 100


segment .text 


global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones


sub rsp,0x20
mov rcx, m1
call printf
add rsp,0x20


sub rsp,0x20 
mov rcx,correo
call gets
add rsp,0x20
	

;sub rsp,0x20
;mov rcx, correo
;call printf
;add rsp,0x20

;Funcion para detectar que es un correo devuelva 0 si no es y 1	si es 

sub rsp,0x20
mov rcx, correo
call  detectorCorreo
add rsp,0x20
; EAX
CMP rax,0
JE noEsCorreo
JMP siEsCorreo
noEsCorreo:
	
	sub rsp,20
		mov rcx,m2
		call printf
	add rsp,20
JMP fin
siEsCorreo:
	sub rsp,20
		mov rcx,m3
		call printf
	add rsp,20
fin:	
	
	sub rsp,0x20
	PUSH qword[a]
	CALL ejSubrutina
	add rsp,0x20
	
ret
;---------------------------------------
;..........subrutinas....................	

detectorCorreo:
; en rcx esta la direccion del correo
mov r8,rcx  ; r8 direccion de correo
push r8
sub rsp,0x20
;mov rcx,rcx
call strlen
add rsp,0x20   ;rcx,rdx,r8,r9
pop r8
; rax = tamaño de la cadena
mov r9,rax ; r9 tamaño de la cadena

mov rcx, r9
xor r12,r12 
xor rbx,rbx
xor r10,r10
xor r11,r11
ciclo:

		mov bl,byte[r8+r12] ; caracter actual en bl
		;comparar primero arroba
		cmp bl,64 ;@ en ascii decimal	
		JE encontroArroba 
		cmp bl,46 ; .  en ascii decimal
		JE encontroPunto
		jmp finArrPunto
	encontroArroba:
	
		MOV R10,1
		JMP finArrPunto
	
	encontroPunto:
		cmp r10,1
		JE siEncontro@antes
		JMP NOEncontro@antes
	siEncontro@antes:
		mov r11,1
	
	finArrPunto:

	NOEncontro@antes:
	;comparar punto
		inc r12
loop ciclo

cmp r10,r11
JNE NoEsCorreoFuncion
;escorreo
mov rax,1
JMP finFuncion
NoEsCorreoFuncion:
XOR rax,rax

finFuncion:
ret

ejSubrutina:
;Prologo
Push rbp
mov rbp,rsp



;epilogo
leave 
;mov rsp,rbp
;pop rbp
ret