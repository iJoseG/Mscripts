#!/bin/bash

set -e

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'

    while ps a | awk '{print $1}' | grep -q "$pid"; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

cd

echo "Se requieren permisos de superusuario..."
sudo -v

# Mantener sudo activo (clave para evitar el bug visual)
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

echo " "
echo "Instalando paquetes necesarios..."
sudo pacman -S --needed base-devel git > /dev/null &
spinner
echo " ✔"


echo " "
echo "Clonando repositorio de yay..."
git clone -q https://aur.archlinux.org/yay.git > /dev/null &
spinner
echo " ✔"

cd yay

echo " "
echo "Compilando e instalando yay..."
makepkg --noconfirm -si > /dev/null 2>&1
echo " ✔"

echo " "
echo " ✔ yay instalado correctamente!"
echo " "
