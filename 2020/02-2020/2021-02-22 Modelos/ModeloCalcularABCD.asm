;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o ModeloCalcularABCD.o ModeloCalcularABCD.asm -l ModeloCalcularABCD.lst
;link:	   -->> gcc -o ModeloCalcularABCD ModeloCalcularABCD.o
;run:      -->> ModeloCalcularABCD
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ModeloCalcularABCD.asm (nombre programa)

extern printf, scanf,gets	

segment .data
;aqui se declaran variables inicializadas
;Var de 32 bits double
formatoDecimal db "%d",0
mA db "Ingresar el valor de A: ",0
mB db "Ingresar el valor de B: ",0
mC db "Ingresar el valor de C: ",0
mD db "El resultado de D: %d ",0
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resd 1
b resd 1
c resd 1
d resd 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;PASO 1 escanear/introducir variables

;printF(&mensaje)
sub rsp,0x20
	mov rcx, mA
	call printf
add rsp, 0x20
; ModeloCalcularABCD(&formato, &variableDestino)

sub rsp,0x20
	mov rcx, formatoDecimal
	mov rdx, a
	call scanf
add rsp, 0x20

;printF(&mensaje)
sub rsp,0x20
	mov rcx, mB
	call printf
add rsp, 0x20

sub rsp,0x20
	mov rcx, formatoDecimal
	mov rdx, b
	call scanf
add rsp, 0x20

;printF(&mensaje)
sub rsp,0x20
	mov rcx, mC
	call printf
add rsp, 0x20

sub rsp,0x20
	mov rcx, formatoDecimal
	mov rdx, c
	call scanf
add rsp, 0x20

;Creamos la subrutina calcular(a,b,c)
sub rsp,0x20
	mov rcx,[a]
	mov rdx,[b]
	mov r8,[c]
	call calcular
add rsp, 0x20

; RETURN EAX

MOV [d],eax
;printF(&mensaje,variable)
; SUBRUTINA (RCX,RDX,R8,R9,...STACK) convencion ABI
sub rsp,0x20
	mov rcx, mD
	mov rdx,[d]
	call printf
add rsp, 0x20

ret
;---------------------------------------
;..........subrutinas....................	

calcular:
;STACK
;INSTRUCCIONES DE CADENA MOVSB
	;rcx,[a]
	;rdx,[b]
	;r8,[c]
		;<<  SAL---SHL
	; 1 a<<3
	sal ecx,3
	; 2 -b*8
	mov r11d,edx
	mov r10d,8
	neg r11d
	IMUL r11d,r10d
	
	;3 b-c
	mov r12d,edx
	sub r12d,r8d
	;4 1 and 2
	and ecx,r11d
	;5  3 elevado (en este caso) a la 3
	imul r12d,r12d
	imul r12d,r12d
	;6 4 entre 5
	
	mov eax,ecx
	;convertir de 32 a 64 para la division
	cdq ; extiende de eax a edx:eax
	idiv r12d
	
	
	


ret



