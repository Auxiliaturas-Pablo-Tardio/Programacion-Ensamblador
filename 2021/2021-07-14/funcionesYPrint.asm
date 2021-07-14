;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o funcionesYPrint.o funcionesYPrint.asm -l funcionesYPrint.lst
;link:	   -->> gcc -o funcionesYPrint funcionesYPrint.o
;run:      -->> funcionesYPrint
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: funcionesYPrint.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a dq 100
b dq 200
s db "Hola",10,0
sc db "Hola %lld",10,0
sd db "Hola %lld y %lld",10,0
fmtI db "%lld",0		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
c resq 1
ab resq 1
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
mov rcx,[a] ;moviendo a parametro 1
mov rdx,[b] ;moviendo a paramentro 2
CALL suma   ; llamar a la funcion suma
mov [c],rax ; c= suma(a,b)
;solo una cadena
sub rsp,0x20
	mov rcx,s
	call printf
add rsp,0x20
;cadena con una variable
sub rsp,0x20
	mov rdx,[a]
	mov rcx,sc
	call printf
add rsp,0x20
;cadena con dos variables
sub rsp,0x20
	mov r8,[b]
	mov rdx,[a]
	mov rcx,sd
	call printf
add rsp,0x20


sub rsp,0x20
	mov rcx,fmtI ; formato a leer o escanear
	mov rdx,ab ; donde guardare el dato
	call scanf
add rsp,0x20

sub rsp,0x20
	mov rcx,fmtI ; Cadena a fusionar
	mov rdx,[ab] ;variable a mostrar
	call printf
add rsp,0x20

	
ret
;---------------------------------------
;..........subrutinas....................	
suma:
	add rcx,rdx ;a+b
	mov rax,rcx
ret



