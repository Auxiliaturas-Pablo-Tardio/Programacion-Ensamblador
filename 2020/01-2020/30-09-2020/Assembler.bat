cd C:\Ensamblador\64Bits\Auxiliaturas\2020\30-09-2020
path C:\Ensamblador\64Bits\Mingw64\bin
nasm -f win64 -o skel64.o skel64.asm -l skel64.lst
gcc -o skel64 skel64.o

pause