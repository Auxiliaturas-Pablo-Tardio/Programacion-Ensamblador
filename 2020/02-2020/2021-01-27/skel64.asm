;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o skel64.o skel64.asm -l skel64.lst
;link:	   -->> gcc -o skel64 skel64.o
;run:      -->> skel64
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: skel64.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a DD 218064958
b DD -10
c DD 63422585
d DD -20
e DD 99		 

		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
x RESD 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rdx,rdx

;d>>3 SAR

MOV edx,[d]
SAR edx,3

;e<<5
mov ecx,[e]
sal ecx,5

;a&b
mov eax,[a]
and eax,[b]
;-c
mov edx,[c]
not edx
; a&b OR  -c 5
OR EAX,EDX

;  6
SUB EDX,ECX

XOR EAX,EDX ;000000001A41FE20

MOV [x],eax
	
ret
;---------------------------------------
;..........subrutinas....................	



