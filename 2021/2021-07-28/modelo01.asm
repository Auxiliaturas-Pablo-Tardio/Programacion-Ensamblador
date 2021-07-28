;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo01.o modelo01.asm -l modelo01.lst
;link:	   -->> gcc -o modelo01 modelo01.o
;run:      -->> modelo01
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo01.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
m1 db "Ingresar el valor de a",10,0
m2 db "Ingresar el valor de b",10,0
m3 db "Ingresar el valor de c",10,0
m4 db "Resultado x = %ld",0
fmtDouble db "%ld",0
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
a resd 1
b  resd 1
c  resd 1
x  resd 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
 
; pedir y leer a
sub rsp,0x20
	mov rcx,m1
	call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmtDouble
	mov rdx,a
	call scanf
add rsp,0x20

; pedir y leer b
sub rsp,0x20
	mov rcx,m2
	call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmtDouble
	mov rdx,b
	call scanf
add rsp,0x20

; pedir y leer b
sub rsp,0x20
	mov rcx,m3
	call printf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmtDouble
	mov rdx,c
	call scanf
add rsp,0x20

xor rcx, rdx
xor rdx, rdx
xor r8,r8

sub rsp,0x20
;Si fuera por referencia
; 1 . quitar corchetes
	mov ecx,dword[a]
	mov edx,dword[b]
	mov r8d,dword[c]
	call calcular
add rsp,0x20	

mov [x],rax

sub rsp,0x20
	mov rcx,m4
	mov rdx,[x]
	call printf
add rsp,0x20

ret
;---------------------------------------
;..........subrutinas....................	
calcular:
; rcx en 1er parametro a 
; rdx es 2do param b
; r8 el 3er param c

;Si fuera por referencia
; solo tengo direcciones
; rcx en 1er direccion a 
; rdx es 2do direccion b
; r8 el 3er direccion c 
; mov r10,[rcx] extraer el valor


mov r9d,edx
neg  r9d ;-b

SAR ecx,5 ; 2
 
sub r8d,edx ;3 

and edx,0xABCDEF ;4
;1* 80
IMUL r9d,80 ;5
 
sub ecx,20 ;6 
      
xor r8d,edx ;7

;8=6/7
xor rax,rax 
mov eax,ecx
cdq
idiv r8d 
; eax cociente
;edx residuo
;9 = 5|8

or eax,r9d

;si es que la referencia me dijera que altere en el primer param

ret



