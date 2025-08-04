@echo off
REM Primero ingresa al directorio indicado y luego borra el archivo .txt
cd C:\Users\Sesagean\Desktop\BATCH_EJEMPLOS
del clave.txt

REM Crea un archivo .txt con un mensaje adentro  
echo.
echo Tus claves han sido borradas > clave.txt
echo.

exit