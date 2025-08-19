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

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo " "

linea0=" "
linea1="source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
linea2="source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

linea3='alias deit="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/datetoday.sh)"'

linea4='alias actrepo="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/actrepo.sh)"'

linea5='alias ll="ls -la"'

linea6='ZSH_THEME="powerlevel10k/powerlevel10k"'



# Agregar cada línea si no existe
for linea in "$linea0" "$linea1" "$linea2" "$linea3" "$linea4" "$linea5" "$linea6"; do
    if ! grep -Fxq "$linea" ~/.zshrc; then
        echo "$linea" >> ~/.zshrc
        echo "Agregado: $linea"
    else
        echo "Ya existía: $linea"
    fi
    echo " "
done

echo "Ejecute 'sudo pacman -S nerd-fonts' y cambie la fuente de su terminal"

sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

zsh
#zsh $(source ~/.zshrc)
