cd C:\Ensamblador\64Bits\Auxiliaturas\2020\02-2020\2021-02-20ModelosPrintScan
path C:\Ensamblador\64Bits\Mingw64\bin
nasm -f win64 -o Print.o Print.asm -l Print.lst
gcc -o Print Print.o
nasm -f win64 -o ScanF.o ScanF.asm -l ScanF.lst
gcc -o ScanF ScanF.o
print
pause