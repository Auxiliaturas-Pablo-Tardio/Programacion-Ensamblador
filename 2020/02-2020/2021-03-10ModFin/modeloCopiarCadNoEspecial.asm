;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modeloCopiarCadNoEspecial.o modeloCopiarCadNoEspecial.asm -l modeloCopiarCadNoEspecial.lst
;link:	   -->> gcc -o modeloCopiarCadNoEspecial modeloCopiarCadNoEspecial.o
;run:      -->> modeloCopiarCadNoEspecial
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modeloCopiarCadNoEspecial.asm (nombre programa)

extern printf, scanf,gets,strlen	

segment .data
;aqui se declaran variables inicializadas
m1 db "Ingresar la cadena de caracteres(max 100 caracteres)",0
m2 db "la nueva cadena copiada es: %s",0
fmt db "%s",0

segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
cad1 resb 100 
cad2 resb 100

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

;imprimir mensaje de escaneo

sub rsp,0x20
	mov rcx,m1
	call printf
add rsp,0x20

; Escaneo de cadena
sub rsp,0x20
	mov rcx,cad1
	call gets
add rsp,0x20

sub rsp,0x20
	mov rcx, cad1
	call strlen
add rsp, 0x20
; RAX 


sub rsp,0x20
	mov rcx,cad1 
	mov rdx,cad2
	mov r8,rax
	call copyCad
add rsp,0x20

;imprimos el resultado
sub rsp,32
	mov rdx,cad2
	mov rcx,m2
	call printf
add rsp,32
ret
;---------------------------------------
;..........subrutinas....................	

copyCad:
; Usamos el espacio sombra
mov [rsp+8],rcx    ;1er variable
mov	[rsp+16],rdx 	;2da variable
mov [rsp+24],r8		;3er variable
mov rcx,[rsp+24]
mov r11,[rsp+8] ; direccion de vector origen  

mov rdx,[rsp+16] ; direccion de arreglo destino

ciclo:
	push rcx
	; extraer elemento actual
	mov r12b,[r11]
	
	; comprobar si es letra
	sub rsp,0x20
		movzx rcx,r12b
		call esLetra
	add rsp,0x20
	; devuelve un boolean en rax, 0 o 1
	CMP RAX,1
	JE seCumplioLetra
	JMP elseSeCumplioLetra
	
	seCumplioLetra:
	seCumplioNumero:
	; movemos el elemento actual al vector copia
		mov [rdx],r12b
		inc rdx
		JMP finCondiciones
	elseSeCumplioLetra:	
	; comprobar si es num
	sub rsp,0x20
		movzx rcx,r12b
		call esNum
	add rsp,0x20
	CMP RAX,1
	JE seCumplioNumero
	finCondiciones:
	
inc r11
pop rcx
loop ciclo



ret

esLetra:
	; Usamos el espacio sombra
mov [rsp+8],rcx    ;1er variable nuestro caracter
 CMP qword[rsp+8],0x41 ; comienzo de Mayusculas
 ;>=
 JGE puedeSerMayuscula
 JMP noEsLetra			;noEsMayuscula
 
 puedeSerMayuscula:
 ;cierro el rango
 CMP qword[rsp+8],0x5A
 ;<=
 JLE esMayuscula
 JMP puedeSerMinuscula
 puedeSerMinuscula:
	CMP qword[rsp+8],0x61
	JGE inicioMinuscula
	JMP noEsLetra
		inicioMinuscula:
		;cierro el rango
			cmp qword[rsp+8],0x7A
			JLE esMinuscula
			JMP noEsLetra
	
		esMayuscula:
		esMinuscula:
		mov rax,1 ;return true
		JMP finEsLetra
		noEsLetra:
		mov rax,0 ; return false
finEsLetra:
ret

esNum:
mov [rsp+8],rcx    ;1er variable nuestro caracter
 CMP qword[rsp+8],0x30
 ;>=
 JGE puedeSerNumero
 JMP noEsNumero
 puedeSerNumero:
	;cierre del rango
	cmp qword[rsp+8],0x39
	JLE esNumero
	JMP noEsNumero
	
esNumero:
mov rax,1
jmp finEsNum
noEsNumero:
mov rax,0	
 finEsNum:
ret

