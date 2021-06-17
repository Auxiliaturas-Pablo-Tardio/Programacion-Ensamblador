path C:\Ensamblador\64Bits\Mingw64\bin
cd C:\Ensamblador\64Bits\Auxiliaturas\2020\01-2020\12-08-2020
nasm -f win64 -o ejercicioSumaVect.o ejercicioSumaVect.asm -l ejercicioSumaVect.lst
gcc -o ejercicioSumaVect ejercicioSumaVect.o
PAUSE


