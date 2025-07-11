#!/bin/bash

echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o ="
echo " "
echo " "
echo "      INSTALANDO ZSH + OHMYZSH by jguerra"
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o ="

sleep 2
echo " "
# Instalar paquetes base (descomenta si es necesario)
sudo apt update

# Actualizar e instalar Zsh
sudo apt install -y zsh git curl

echo " "
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo " "
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
echo " "

linea1="source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
linea2="source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Agregar cada línea si no existe
for linea in "$linea1" "$linea2"; do
    if ! grep -Fxq "$linea" ~/.zshrc; then
        echo "$linea" >> ~/.zshrc
        echo "Agregado: $linea"
    else
        echo "Ya existía: $linea"
    fi
    echo " "
done

zsh

