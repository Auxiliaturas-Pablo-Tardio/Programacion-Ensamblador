;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o Print.o Print.asm -l Print.lst
;link:	   -->> gcc64 -o Print Print.o
;run:      -->> Print
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: Print.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
m1  db "Hola que tal",0
m2 db "Los valores son %lld y %lld",0
m3 db "Los valores son 1:%ld    2: %lld    3: %lld    4: %lld     5: %lld     6: %lld",0
v1 dq 217064957
v2 dq 200	
v3 dQ 300
v4 dQ 400
v5 dq 500
v6 dq 600		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

;le pasamos el mensaje solamente(1 parametro)
sub rsp,0x20
mov rcx, m1 ;por referencia
call printf
add rsp, 0x20

; Mensaje + Variable
sub rsp,0x20
; rcx, rdx, r8

mov r8,[v2]
mov rdx,[v1]
mov rcx,m2
call printf

movsx r8,byte[v3]
movsx rdx,byte[v4]
mov rcx,m2
call printf
add rsp,0x20  

;PrintF con mas de 4 parametros

push qword[v6]
push  qword[v5]
push qword[v4]
sub rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space 
mov r9,[v3]
mov r8,[v2]
mov rdx,[v1]
mov rcx,m3
call printf
add rsp,24
add rsp,0x20
ret
;---------------------------------------
;..........subrutinas....................	



