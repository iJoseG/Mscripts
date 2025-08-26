#!/bin/bash

echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o ="
echo " "
echo " "
echo "      INSTALANDO ZSH + OHMYZSH by jguerra"
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o ="

sleep 1
echo " "
# Instalar paquetes base (descomenta si es necesario)
# sudo pacman -Syu
# pacman -S git zsh nano vim less curl

# Actualizar e instalar Zsh
# sudo pacman -S --noconfirm zsh git curl

chsh -s /bin/zsh

echo " "

RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo " "
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
echo " "

linea0=" "
linea1="source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
linea2="source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

linea3='alias deit="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/datetoday.sh)"'

linea4='alias actrepo="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/actrepo.sh)"'

linea5='alias ll="ls -la"'


# Agregar cada línea si no existe
for linea in "$linea0" "$linea1" "$linea2" "$linea3" "$linea4" "$linea5" ; do
    if ! grep -Fxq "$linea" ~/.zshrc; then
        echo "$linea" >> ~/.zshrc
        echo "Agregado: $linea"
    else
        echo "Ya existía: $linea"
    fi
    echo " "
done

echo "Ejecute 'sudo pacman -S nerd-fonts' y cambie la fuente de su terminal"

zsh

sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

source ~/.zshrc
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k 

#zsh $(source ~/.zshrc)
