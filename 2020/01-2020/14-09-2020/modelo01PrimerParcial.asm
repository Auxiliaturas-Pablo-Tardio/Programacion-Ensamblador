;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o modelo01PrimerParcial.o modelo01PrimerParcial.asm -l modelo01PrimerParcial.lst
;link:	   -->> gcc64 -o modelo01PrimerParcial modelo01PrimerParcial.o
;run:      -->> modelo01PrimerParcial
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: modelo01PrimerParcial.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
rango dq 3		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
x resq 1

segment .text 
global main 					
main:	

;caso especial division entre 0
CMP qword[rango],0
JE fin
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
xor rax,rax
xor rbx,rbx
xor rcx,rcx
xor rdx,rdx
xor r8,r8
; contador = rcx

mov rcx,1


cicloserie:

;Cubo 2Elevado0=1 2Elevado1=2 2Elevado2=4 2Elevado3=8
;Manera Lineal
;MOV RAX,rcx
;MOV RBX,RAX
;IMUL RAX,RBX
;IMUL RAX,RBX
;Manera Ciclo
mov rbx,[rango]
mov r8,RBX  ; rbx =exponente
xor r9,r9
mov r9,1
cicloElevar:
IMUL R9,rcx
dec r8
JNZ cicloElevar
mov rax,r9
;Almacenar el valor

ADD RDX,RAX ; C=0  c=c+valor que entra

;controlar el cicloserie
INC rcx ;= ADD RCX,1
;while (rcx<=rango)

cmp rcx,[rango]
;cbw
;cwd
;cdq

JLE cicloserie ;Jump less or equal
MOV RAX,RDX
cqo
IDIV qword[rango]

mov [x],rax
fin:
ret 
;---------------------------------------
;..........subrutinas....................	



