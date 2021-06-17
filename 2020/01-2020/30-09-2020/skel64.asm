;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
x dq -80538738812075974
y dq 80435758145817515
z dq 12602123297335631
m1 db "el resultado es : %d",0	

m2 db "el resultado es incorrecto",0
m3 db "el resultado esta verificado",0	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
XALTA RESQ 1
XBAJA RESQ 1
YALTA RESQ 1
YBAJA RESQ 1
ZALTA RESQ 1
ZBAJA RESQ 1
K resq 1

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

mov rax,[x]
mov rax,[y]
mov rax,[z]
xor rax,rax

push qword[x]
call elevarCubo
SUB RSP,8

MOV [XALTA],RDX
MOV [XBAJA],RAX

push qword[y]
call elevarCubo
SUB RSP,8

MOV [YALTA],RDX
MOV [YBAJA],RAX

push qword[z]
call elevarCubo
SUB RSP,8

MOV [ZALTA],RDX
MOV [ZBAJA],RAX

ADD RAX,[XBAJA] 
adC rdx,[XALTA]

ADD RAX,[YBAJA]
adC rdx,[YALTA]


MOV [K],RAX
cmp qword[K],42
JE correcto

JMP incorrecto
correcto:
MOV RCX,m3

;PUSH QWORD[K]
;PUSH m1
CALL printf
add rsp,10	
jmp fin

incorrecto:

MOV RCX,m2

;PUSH QWORD[K]
;PUSH m1
CALL printf
add rsp,10	

fin:

MOV RDX,QWORD[K]
MOV RCX,m1

;PUSH QWORD[K]
;PUSH m1
CALL printf
add rsp,20	
	
	
ret
;---------------------------------------
;..........subrutinas....................	

elevarCubo:
; PROLOGO
push rbp
mov rbp,rsp

Mov rbx, [rbp+16] ; mover a rbx la variable de entrada
MOV RAX,1
mov rcx,3
ciclo:

IMUL rbx

loop ciclo

;EPILOGO
mov rsp,rbp
pop rbp
ret



