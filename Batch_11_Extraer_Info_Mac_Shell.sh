#!/bin/bash

# Crear carpeta con nombre dinámico
HOSTNAME=$(hostname)
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTPUT_DIR="Info_Mac_${HOSTNAME}_${TIMESTAMP}"
mkdir -p "$OUTPUT_DIR"

# Función para guardar comandos
function save() {
    local name=$1
    local cmd=$2
    echo "[+] Guardando $name..."
    echo "### $cmd" > "$OUTPUT_DIR/$name.txt"
    eval "$cmd" >> "$OUTPUT_DIR/$name.txt" 2>/dev/null
}

# Información general del sistema
save "sistema" "system_profiler SPSoftwareDataType"
save "hardware" "system_profiler SPHardwareDataType"
save "almacenamiento" "system_profiler SPStorageDataType"
save "discos" "diskutil list"
save "smart_status" "diskutil info disk0"

# Red
save "interfaces_de_red" "ifconfig"
save "ip_rutas" "netstat -rn"
save "dns" "scutil --dns"
save "puertos_abiertos" "lsof -nP -iTCP -sTCP:LISTEN"

# CPU y RAM
save "cpu" "sysctl -n machdep.cpu.brand_string"
save "ram" "sysctl hw.memsize"

# Usuarios y grupos
save "usuarios" "dscl . list /Users"
save "grupos" "dscl . list /Groups"
save "usuarios_logueados" "who"
save "permisos_sudo" "cat /etc/sudoers"

# Procesos y servicios
save "procesos" "ps aux"
save "servicios" "launchctl list"

# Aplicaciones instaladas
save "aplicaciones" "ls /Applications"
save "paquetes_brew" "brew list" # Solo si tienes Homebrew
save "paquetes_mas" "mas list"   # Solo si tienes mas-cli

# Variables de entorno
save "entorno" "printenv"

# Dispositivos conectados
save "usb" "system_profiler SPUSBDataType"
save "thunderbolt" "system_profiler SPThunderboltDataType"
save "bluetooth" "system_profiler SPBluetoothDataType"

# Logs recientes
save "log_sistema" "log show --predicate 'eventMessage contains \"error\"' --last 1h"
save "dmesg" "dmesg | tail -n 100"

echo ""
echo "✅ Toda la información fue guardada en la carpeta: $OUTPUT_DIR"