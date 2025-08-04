@echo off
REM Crear archivo, solicitando nombre y contenido de este archivo.
set/p nombre= Por favor escribe el nombre que llevara el documento:
if exist %nombre%.txt (goto seguir) else (cd "C:\Users\Sesagean\Desktop\BATCH_EJEMPLOS\" & goto seguir)
:seguir 
set/p contenido= Por favor escribe el contenido que lleva el archivo:
echo %contenido% > "C:\Users\Sesagean\Desktop\BATCH_EJEMPLOS\%nombre%.txt"

REM Crear carpeta y le muevo el archivo recien creado a esa carpeta
mkdir carpeta1
move %nombre%.txt carpeta1
pause