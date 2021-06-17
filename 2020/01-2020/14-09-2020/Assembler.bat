cd C:\Ensamblador\64Bits\Auxiliaturas\2020\14-09-2020
path C:\Ensamblador\64Bits\Mingw64\bin
nasm -f win64 -o modelo01PrimerParcial.o modelo01PrimerParcial.asm -l modelo01PrimerParcial.lst
gcc -o modelo01PrimerParcial modelo01PrimerParcial.o

pause