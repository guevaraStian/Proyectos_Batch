#!/bin/bash
# Script generado autom�ticamente



#!/bin/bash

# Mostrar un mensaje
echo "Hola, este es un script de shell."

# Listar archivos en el directorio actual
#ls -la

# Mostrar la fecha actual
date

# Windows
winget install --id Python.Python.3 --source winget
# Linux
#sudo apt install python3 python3-pip
# MAC
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#brew install python

# Validar versiones de python
python --version
pip --version

# Instalar librerias de python, ejemplos
pip install opencv-python mss numpy sounddevice scipy moviepy psutil wmi socket os platform hashlib


# Dar todos los permisos para el archivo python
#Windows 
icacls archivo_py.py /grant Everyone:F
#Linux y MAC
#chmod 777 archivo_py.py
# Ejecutar un script Python
python archivo_py.py









