;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o ScanF.o ScanF.asm -l ScanF.lst
;link:	   -->> gcc64 -o ScanF ScanF.o
;run:      -->> ScanF
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ScanF.asm (nombre programa)

extern printf, scanf,gets,fgets		

segment .data
;aqui se declaran variables inicializadas
PF DD 0b1.110.0110.0110.0110.0110.0110
formatoDecimal db "%lld ",0
formatoString db "%s",0	
stdin db 1
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
v1 resq 1
miCad resb 100
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

;le pasamos el formato 1
; donde almacenar 2
sub rsp,0x20
mov rdx,v1
mov rcx,formatoDecimal
call scanf
add rsp,0x20



;GETS un escaneo para string con espacios
sub rsp,0x20
	mov rcx,miCad
	call gets  
add rsp,0x20
;FGETS un escaneo para string con espacios PERO SI SE PUEDE USAR LUEGO..
; DE UN SCANF



sub rsp, 0x20
	mov rdx,[v1]
	mov rcx,formatoDecimal
	call printf
add rsp,0x20

sub rsp, 0x20
	mov rcx,miCad
	call printf
add rsp,0x20

ret
;---------------------------------------
;..........subrutinas....................	



