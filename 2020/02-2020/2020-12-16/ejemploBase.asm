;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o ejemploBase.o ejemploBase.asm -l ejemploBase.lst
;link:	   -->> gcc -o ejemploBase ejemploBase.o
;run:      -->> ejemploBase
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ejemploBase.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
;Byte
A db 255
variableUnob  db +255
variableDosB DB 155
variableTresB DB -1		
;Word
variableUnoW DW 65535
variableDosW DW -32767
variableTresW DW -1	
;Double
variableUnoDouble DD 4000000000
variableDosD DD 0x12345678
variableTresD DD -1	
;Quad
variableUnoQ DQ 4000000000000
variableDosQ DQ 0x123456 78
variableTresQ DQ -1	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
;Byte
varRes1B resb 1
varRes2B resb 4
;word
varRes1W RESW 1
varRes2W RESW 4
;DOUBLE
varRes1D RESD 1
varRes2D RESD 4
;QUAD 
quadRes1Q resQ 2

segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones

MOV [A],bl
	
ret
;---------------------------------------
;..........subrutinas....................	



