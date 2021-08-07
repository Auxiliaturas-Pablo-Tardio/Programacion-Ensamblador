cd C:\Ensamblador\64Bits\Auxiliaturas\2021\2021-08-04
path C:\Ensamblador\64Bits\Mingw64\bin

nasm -f win64 -o modeloFinal.o modeloFinal.asm -l modeloFinal.lst
gcc -o modeloFinal modeloFinal.o
modeloFinal
pause