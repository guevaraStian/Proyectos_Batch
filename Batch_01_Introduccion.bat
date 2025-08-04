@echo off
REM Forma de imprimir en pantalla un mensaje
echo Hola mundo!!

REM Forma de solicitar que el cliente ingrese informacion
set/p info= Por favor escribe tu informacion

REM Ejemplo de estructura de un if
if info == 1 (echo numero) else (echo letra)

REM Declaracion y ejecucion de etiquetas o funciones
:correcto
echo Respuesta correcta!!
goto correcto

pause