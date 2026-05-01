#!/bin/bash
# Script para instalar ventoy en un disco/usb
# Date: 30/04/2026

set -e

# Validar que wget y tar esten instalados y funcionales
if ! command -v wget &> /dev/null; then
    echo "Error: wget no está instalado o no es funcional."
    exit 1
fi

if ! command -v tar &> /dev/null; then
    echo "Error: tar no está instalado o no es funcional."
    exit 1
fi
# Identificar el disco
lsblk

# Ingresar el nombre del disco y la particion donde se va a instalar ventoy
echo " "
read -p "Ingrese el nombre del disco/usb donde se va a instalar ventoy (ej. sda): " disk

# Validar que el disco exista
if [ ! -b "/dev/$disk" ]; then
    echo "Error: El dispositivo /dev/$disk no existe."
    exit 1
fi

#Descargar ventoy v1.1.22 desde repos de GitHub
wget https://github.com/ventoy/Ventoy/releases/download/v1.1.12/ventoy-1.1.12-linux.tar.gz

#Descomprimir el archivo .tar.gz
tar -xzvf ventoy-1.1.12-linux.tar.gz

# Entrar al directorio
cd ventoy-1.1.12/

#Dar permisos de ejecucion al script
chmod +x Ventoy2Disk.sh

# Ejecutar el script de instalacion de ventoy
sudo ./Ventoy2Disk.sh -i /dev/"$disk"
