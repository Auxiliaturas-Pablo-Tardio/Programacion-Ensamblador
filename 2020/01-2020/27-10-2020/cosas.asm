;218058144 VELIZ VIDAL FADUA JOSELINE

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;nasm -f win64 -o 218058144.obj 218058144.asm -l 218058144.lst
;gcc -o 218058144 218058144.obj
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: shift-log.asm

extern printf, scanf,strlen, gets	

segment .data

msj1	db      10,9,"*****  PROGRAMA DE ENCRIPTACION  *****",10, 0
msj2	db      10,"Ingresar cadena a encriptar:", 0
msj3	db      10,"Ingresar la clave de encriptacion:", 0
msj4	db		10,"La cadena encriptada es: %s", 10, 0
fmt		db		"%lld", 0

		
segment .bss

cadena	resb 100 ;100 carecteres  maximos
clave 	resd 1

segment .text 
global main 					
main:
	
	sub rsp, 0x20
		mov rcx, msj1	
		call printf
	add rsp, 0x20
	
	sub rsp, 0x20
		mov rcx, msj2	
		call printf
	add rsp, 0x20
	
	sub rsp, 0x20
		mov rcx, cadena		
		call gets
	add rsp, 0x20
	
	sub rsp, 0x20	
		mov rcx, msj3	
		call printf
	add rsp, 0x20
	
	sub rsp, 0x20
		mov rdx, clave
		mov rcx, fmt	
		call scanf
	add rsp, 0x20
	
	sub rsp, 0x20
		mov rcx,cadena
		mov rdx,[clave]
		call codificar
	add rsp, 0x20

	sub rsp, 0x20	
		mov rcx, msj4	
		mov rdx,cadena
		call printf
	add rsp, 0x20	
	
ret
;----subrutinas---
codificar:
		mov rdi,rcx ;cadena
		mov rsi,rdx	;clave
		xor rbx,rbx	;caracter
		
	ciclo1:
		mov bl,[rdi]
		cmp bl,0
		je fin1
		
		mov rcx,rbx
		call CodigoCaracter
		
		cmp rax,1
		jne encriptarminusculas
		sub bl,65
		mov rax,rsi
		add bl,al
		mov al,bl
		cbw
		mov cl,26
		div cl
		mov bl,ah
		add bl,65
		jmp incremento
	
	encriptarminusculas:
		cmp rax,2
		jne incremento
		sub bl,97
		mov rax,rsi
		add bl,al
		mov al,bl
		cbw
		mov cl,26
		div cl
		mov bl,ah
		add bl,97
		jmp incremento
		
		
		
	incremento:	
		mov [rdi],bl
		inc rdi
		jmp ciclo1
	fin1:
	
ret
CodigoCaracter:
		cmp rcx,65
		jb noEsLetra
		cmp rcx,90
		jbe esMayuscula
		
		cmp rcx,97
		jb  noEsLetra
		cmp rcx,122
		ja noEsLetra
		;es minuscula
		mov rax,2   
		jmp fin2
		
	esMayuscula:
		mov rax,1
		jmp fin2
		
		
	
	noEsLetra:
		mov rax,3
	fin2:
ret













