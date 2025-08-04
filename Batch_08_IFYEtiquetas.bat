@echo off
REM Pregunta y luego evaluamos la respuesta en un if

:inicio
echo.
set /p suma= Cuanto es 2 + 2? : 
echo.
if %suma%==4 (goto correcto) else (goto incorrecto)

:correcto
echo Respuesta correcta!!
goto inicio
pause

:incorrecto
echo respuesta incorrecta!!
goto inicio
pause