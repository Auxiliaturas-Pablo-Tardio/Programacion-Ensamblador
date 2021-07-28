cd C:\Ensamblador\64Bits\Auxiliaturas\2021\2021-07-21
path C:\Ensamblador\64Bits\Mingw64\bin

nasm -f win64 -o modeloParcial02_n02.o modeloParcial02_n02.asm -l modeloParcial02_n02.lst
gcc -o modeloParcial02_n02 modeloParcial02_n02.o
modeloParcial02_n02
pause