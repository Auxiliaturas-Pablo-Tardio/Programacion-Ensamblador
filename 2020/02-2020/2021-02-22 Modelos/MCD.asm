;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o MCD.o MCD.asm -l MCD.lst
;link:	   -->> gcc -o MCD MCD.o
;run:      -->> MCD
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: MCD.asm (nombre programa)

extern printf, scanf,gets	

segment .data
;aqui se declaran variables inicializadas
;Var de 32 bits double
formatoDecimal db "%d",0
mA db "Ingresar el valor de A: ",0
mB db "Ingresar el valor de B: ",0

mD db "El mcd de A=%d y B=%d %d ",0
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resd 1
b resd 1

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
; MCD(&formato, &variableDestino)

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

sub rsp,0x20
; mcd (a,b) return mcd en eax
	mov ecx,[a]
	mov edx,[b]
	call mcd
add rsp,0x20

sub rsp,0x20
	mov rcx,mD
	mov rdx,[a]
	mov r8,[b]
	mov r9,rax
	call printf
add rsp,0x20

ret


;---------------------------------------
;..........subrutinas....................	

mcd:
	;   rcx,[a]
	;	rdx,[b]
	; Preguntar cual es el minimo
	;if (a<=b)  menor = al menos
    ;r12 ----1 ----1 numero fue divisible- ----2 numero fue divisible 
	
	cmp ecx,edx ;(a<=b)
	; Numeros Con Signo
	JL esMenorA
	JMP elseEsMenorA
	esMenorA:
		;el menor estara en el registro EAX
		MOV eax,ecx
		JMP finIf ;a es menor que b
	elseEsMenorA:
		mov eax,edx ; b es menor que a
	finIf:
	 
		push rcx  ; stack es de 64 bits
		; salvar rcx

		mov R10d,eax
		cicloDivision:
		;  a , b  .....ecx,edx /R10
		 push rdx
			mov eax,ecx
			
			cdq 
			idiv R10d
			; eax cociente---edx resd
			; if (mod ==0)
			cmp edx,0
			JE EsDivisibleA
			jmp elseNoEsDivisible
			
			
			EsDivisibleA:
			 ; dividir B
			 pop rdx ;recuperar
			 mov eax,edx
			 push rdx ;volvemos a salvar
				cdq 
				idiv R10d
			; eax cociente---edx resd
			; if (mod ==0)
			cmp edx,0
			JE EsDivisibleB
			jmp elseNoEsDivisible
			
			
		elseNoEsDivisible:	
		pop rdx
			
		DEC R10
		CMP R10,0
		JNZ cicloDivision
		jmp saltoNoEsDivisible
		EsDivisibleB:
		pop rdx
		saltoNoEsDivisible:
		
	pop rcx ;recuperar rcx 
mov eax,r10d
ret



