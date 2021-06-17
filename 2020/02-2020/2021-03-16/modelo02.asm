;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo02.o modelo02.asm -l modelo02.lst
;link:	   -->> gcc -o modelo02 modelo02.o
;run:      -->> modelo02
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo02.asm (nombre programa)

extern printf, scanf,strlen,gets		

segment .data
;aqui se declaran variables inicializadas
m1 db "Ingresar la cadena de caracteres (maximo 100 caracteres)",0
m2 db "la cadena tiene un total de %lld :(digitos +letras mayusculas+letras minusculas)",0
fmt db "%s",0	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
cad resb 100

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

sub rsp,32 ; espacio sombra
	mov rcx,m1
	call printf
add rsp,32 ;

; escanear el mensaje

sub rsp,32

	mov rcx,cad
	call gets
add rsp,32

sub rsp,32
	mov rcx,cad
	call strlen ; rax lenth de la cadena
add rsp,32

sub rsp,32
	mov rcx,cad
	mov rdx,rax
	call contar
add rsp,32
; Rax 

sub rsp,32
	mov rcx,m2
	mov rdx,rax
	call printf
add rsp,32
	
ret
;---------------------------------------
;..........subrutinas....................	
contar:
	mov [rsp+8],rcx  ; primer par
	mov [rsp+16],rdx ; segundo par
	
	mov rcx, [rsp+16]
	mov r12, [rsp+8] ;direccion de la cadena
	xor r15,r15
	ciclo:
	push rcx
		;extraer el caracter actual
		mov r13b,[r12] 
		; es numero?
		sub rsp,32
			mov rcx,0x30
			mov rdx,0x39
			movzx r8,r13b
			CALL isCarEnRango
		add rsp,32
		;Preguntar si es true o false
		cmp rax,1
		JE contarChar
		
		; es mayuscula?
		sub rsp,32
			mov rcx,0x41
			mov rdx,0x5A
			movzx r8,r13b 
			CALL isCarEnRango
		add rsp,32
		;Preguntar si es true o false
		cmp rax,1
		JE contarChar
		
		; es minuscula?
		sub rsp,32
			mov rcx,0x61
			mov rdx,0x7A
			movzx r8,r13b 
			CALL isCarEnRango
		add rsp,32
		;Preguntar si es true o false
		cmp rax,1
		JE contarChar
		; no es ninguno
		JMP noEntrar
		contarChar:
		inc r15
		noEntrar:
		
		
		
	inc r12
	pop rcx
	loop ciclo
	
mov rax, r15
	
ret

isCarEnRango:
mov [rsp+8],rcx  ; primer par - rango de inicio
mov [rsp+16],rdx ; segun par - rango de fin
mov [rsp+24],r8 ; tercer par-  caracter a detectar

; if  car es mayor que mi rango de inicio

cmp [rsp+24],rcx
JGE estaCasiDentro
JMP noEsta
estaCasiDentro:
CMP [rsp+24],rdx
JLE cumpleRango
JMP noEsta

cumpleRango:
mov rax,1
JMP finRango
noEsta:
mov rax,0
finRango:
ret

