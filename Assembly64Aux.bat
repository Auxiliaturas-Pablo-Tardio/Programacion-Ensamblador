cd C:\Ensamblador\64Bits\Auxiliaturas\2020\24-06-2020
path C:\Ensamblador\64Bits\Mingw64\bin

nasm -f win64 -o Ejercicio.o Ejercicio.asm -l Ejercicio.lst
x86_64-w64-mingw32-gcc.exe -o Ejercicio.exe Ejercicio.o
:: x86_64-w64-mingw32-gcc.exe Ejercicio.c -o Ejercicio.exe

pause