#!/bin/bash

set -e

VERSION="1.0.1"
if [[ "$1" == "--version" ]]; then
    echo " "
    echo "instyay $VERSION"
    exit 0
fi

echo " "
if command -v yay >/dev/null; then
    echo "✔ yay ya está instalado"
    exit 0
fi

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

cd "$HOME"

echo "Se requieren permisos de superusuario..."
sudo -v

# Mantener sudo activo
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

echo " "
echo "Instalando paquetes necesarios..."
sudo pacman -S --needed --noconfirm base-devel git > /dev/null &
spinner
echo " ✔"

echo " "
echo "Clonando repositorio de yay..."
sudo rm -rf yay
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
