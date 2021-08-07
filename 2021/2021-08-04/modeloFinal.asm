;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modeloFinal.o modeloFinal.asm -l modeloFinal.lst
;link:	   -->> gcc -o modeloFinal modeloFinal.o
;run:      -->> modeloFinal
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modeloFinal.asm (nombre programa)

extern printf, scanf,gets,strlen		

segment .data
;aqui se declaran variables inicializadas
m1 db "Ingresar la cadena de caracteres (max 100 caracteres)",0
m2 db "La nueva cadena copiada es: %s",0
		
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
 
sub rsp,0x20
	mov rcx,m1
	call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,cad1
	call gets
add rsp,0x20
; hasta este punto la cadena esta cargada

sub rsp,0x20
	mov rcx,cad1
	call strlen
add rsp,0x20
; return en rax


sub rsp,0x20
	mov rcx,cad1
	mov rdx,cad2
	mov r8,rax
	call copyCad
add rsp,0x20

sub rsp,0x20
	mov rcx,m2
	mov rdx,cad2
	call printf
add rsp,0x20	
ret
;---------------------------------------
;..........subrutinas....................	
copyCad:
;rcx direccion cad1
; rdx direccion cad2
;r8 longitud de cadena
;salvamos los parametros
mov [rsp+16],rcx ;direccion de la cad1
mov [rsp+24],rdx
mov [rsp+32],r8
mov  r12,[rsp+24];indice cad2
mov rcx,r8 ; en rcx la longitud
mov r11,[rsp+16]
cicloCadena:
push rcx
	;extraccion de caracteres
	mov r13b,[r11]
	XOR RCX,RCX
	sub rsp,0x20
		mov cl,r13b
		mov rdx,0x30
		mov r8,0x39
		call dentroRango
	add rsp,0x20
	;return rax
	CMP rax,1 
	JE copiar
	xor rcx,rcx
	sub rsp,0x20
		mov cl,r13b
		mov rdx,0x41
		mov r8,0x5A
		call dentroRango
	add rsp,0x20
	;return rax
	CMP rax,1 
	JE copiar
	xor rcx,rcx
	sub rsp,0x20
		mov cl,r13b
		mov rdx,0x61
		mov r8,0x7A
		call dentroRango
	add rsp,0x20
	;return rax
	CMP rax,1 
	JE copiar 
	
	JMP saltarCopiar
	copiar:
		;copiamos el caracter
		mov [r12],r13b
		inc r12
	
	saltarCopiar:
	inc r11
pop rcx
loop cicloCadena

ret

dentroRango:
mov [rsp+16],rcx ;1 CARACTER
mov [rsp+24],rdx ;2 RANGO INICIAL
mov [rsp+32],r8;3 RANGO FINAL

cmp rcx,rdx
JGE esMayor
JMP incorrecto
esMayor:
	CMP RCX,r8
	JLE correcto
	JMP incorrecto
correcto:
	mov rax,1
	JMP finRango
incorrecto:
	mov rax,0

finRango:
RET


