#!/bin/bash

mkdir -p Info_Windows_$(hostname)_$(date +%Y%m%d_%H%M%S)
cd Info_Windows_$(hostname)_$(date +%Y%m%d_%H%M%S)

# Información general del sistema
systeminfo > sistema.txt

# Información de red
ipconfig /all > red.txt
netstat -anob > conexiones.txt 2>&1

# Información de procesos
tasklist > procesos.txt
powershell "Get-Process | Sort-Object CPU -Descending" > procesos_detallados.txt

# Información de hardware
wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors > cpu.txt
wmic memorychip get capacity,manufacturer,speed > memoria.txt
wmic diskdrive get model,size,serialnumber > discos.txt
powershell "Get-PhysicalDisk | Format-Table" > discos_detallado.txt

# Programas instalados
wmic product get name,version > programas.txt
powershell "Get-WmiObject -Class Win32_Product | Select-Object Name, Version" > programas_detallado.txt

# Servicios
sc query > servicios.txt
powershell "Get-Service | Where-Object { \$_.Status -eq 'Running' }" > servicios_activos.txt

# Usuarios
net user > usuarios.txt
powershell "Get-LocalUser" > usuarios_detallado.txt

# Variables de entorno
set > entorno.txt

# Información del BIOS
wmic bios get manufacturer, smbiosbiosversion > bios.txt

# Información de eventos recientes (últimas 20 entradas del sistema)
powershell "Get-EventLog -LogName System -Newest 20" > eventos.txt

# Información de firewall
netsh advfirewall show allprofiles > firewall.txt

# Información de actualizaciones
powershell "Get-HotFix" > actualizaciones.txt

echo "(+) Información del sistema guardada en la carpeta info_equipo"