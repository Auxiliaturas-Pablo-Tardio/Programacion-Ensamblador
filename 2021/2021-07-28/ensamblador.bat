cd C:\Ensamblador\64Bits\Auxiliaturas\2021\2021-07-28
path C:\Ensamblador\64Bits\Mingw64\bin

nasm -f win64 -o modelo01.o modelo01.asm -l modelo01.lst
gcc -o modelo01 modelo01.o
modelo01
pause