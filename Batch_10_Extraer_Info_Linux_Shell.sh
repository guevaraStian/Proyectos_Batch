#!/bin/bash

OUTPUT_DIR="Info_linux_$(hostname)_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

# Función para guardar salida
function save() {
    echo "[+] Guardando $1..."
    $2 > "$OUTPUT_DIR/$1.txt" 2>/dev/null
}

# Información general del sistema
save "hostname" "hostnamectl"
save "os_release" "cat /etc/os-release"
save "uptime" "uptime -p"
save "kernel" "uname -a"
save "env_variables" "printenv"

# CPU y memoria
save "cpu_info" "lscpu"
save "mem_info" "free -h"

# Información de disco
save "disk_usage" "df -hT"
save "mounts" "mount | column -t"
save "lsblk" "lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,UUID"
save "blkid" "blkid"
save "parted" "sudo parted -l"

# BIOS y hardware
save "dmesg" "dmesg | tail -n 50"
save "bios" "sudo dmidecode -t bios"
save "motherboard" "sudo dmidecode -t baseboard"
save "memory_slots" "sudo dmidecode -t memory"
save "cpu_details" "sudo dmidecode -t processor"

# PCI y USB
save "pci_devices" "lspci"
save "usb_devices" "lsusb"

# Red
save "ip_addr" "ip addr"
save "ip_route" "ip route"
save "interfaces" "cat /etc/network/interfaces"
save "resolv" "cat /etc/resolv.conf"
save "hosts" "cat /etc/hosts"
save "netstat" "netstat -tulnpe"
save "ss" "ss -tulnp"

# Usuarios y grupos
save "logged_users" "w"
save "users" "cut -d: -f1 /etc/passwd"
save "groups" "cut -d: -f1 /etc/group"
save "sudoers" "cat /etc/sudoers"

# Servicios y procesos
save "running_services" "systemctl list-units --type=service --state=running"
save "all_services" "systemctl list-unit-files --type=service"
save "top_processes" "ps aux --sort=-%mem | head -n 20"

# Paquetes instalados
if command -v dpkg &> /dev/null; then
    save "installed_packages" "dpkg -l"
elif command -v rpm &> /dev/null; then
    save "installed_packages" "rpm -qa"
elif command -v pacman &> /dev/null; then
    save "installed_packages" "pacman -Q"
fi

# Firewall
if command -v iptables &> /dev/null; then
    save "iptables_rules" "sudo iptables -L -v -n"
fi

if command -v nft &> /dev/null; then
    save "nftables_rules" "sudo nft list ruleset"
fi

# Logs del sistema
save "syslog" "tail -n 100 /var/log/syslog"
save "dmesg_full" "dmesg"
save "auth_log" "tail -n 100 /var/log/auth.log"

echo -e "\n✅ Toda la información se ha guardado en: $OUTPUT_DIR/"