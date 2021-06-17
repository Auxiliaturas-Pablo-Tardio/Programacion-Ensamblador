;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a dd -250
b dd 218090617 
c dd 7342303
d dd -99

 
segment .bss 
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
y resd 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
Xor rax,rax
Xor rbx,rbx
Xor rcx,rcx
Xor rdx,rdx	

mov ecx,[c]
sub ecx,97  ;Listo 1

MOV edx,[d]
NEG edx ; parte 2

MOV eax,[a]
sub eax,ecx ;parte 3

Sub eax,edx  ;parte 4

mov ecx,eax  ; MOVEMOS A "x" 


mov edx,[d] ;A
add edx,49

mov eax,[a] ;B
add eax,35


SUB EAX,[b] ;C

add edx,ecx ;D

SUB EDX,EAX	 ;E

MOV [y],edx


Xor rax,rax
Xor rbx,rbx
Xor rcx,rcx
Xor rdx,rdx	

mov edx,[d]
add edx,50  ; punto 1

mov eax,[a]
add eax,38 ; Punto 2

sub eax,[b] ;punto 3

sub edx,eax ;;YA TENEMOS X =EDX

MOV ecx,[c]
sub ecx,90 ;tenemos A
mov ebx,[d] ; tenemos B
neg ebx

SUB ECX,EBX

SUB EDX,ECX

MOV [y],edx



ret
;---------------------------------------
;..........subrutinas....................	



