#!/bin/bash

echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = "
echo " "
echo " "
echo "      INSTALANDO ZSH + OHMYZSH + Starship-prompt by jguerra"
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = "

sleep 1
echo " "
# Instalar paquetes base
#pacman -Syu
sudo pacman -S --needed --noconfirm git zsh nano vim less curl eza

#chsh -s /bin/zsh
# Instalacion de JetBrainsMono Nerd Font
# Directorio de instalación para el usuario
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# Versión actual de Nerd Fonts (puedes cambiarla si lo deseas)
VERSION="v3.2.1"
ZIP="JetBrainsMono.zip"
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/$ZIP"

echo "Descargando JetBrainsMono Nerd Font..."
wget -q --show-progress "$URL" -O /tmp/$ZIP

echo "Extrayendo fuentes..."
unzip -o /tmp/$ZIP -d "$FONT_DIR" > /dev/null

echo "Actualizando caché de fuentes..."
fc-cache -fv > /dev/null

echo "✔ JetBrainsMono Nerd Font está listo."


echo " "

RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo " "
curl -sS https://starship.rs/install.sh | sh
echo " "

echo " "
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
echo " "

linea0=" "
linea1="source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
linea2="source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
linea3='alias deit="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/datetoday.sh)"'
linea4='alias actrepo="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/actrepo.sh)"'
#linea5='alias ll="ls -la"'
linea5="alias ls='eza --icons --color=auto --group-directories-first'"
linea6="alias ll='eza -l --icons --color=auto --group-directories-first'"
linea7="alias la='eza -la --icons --color=auto --group-directories-first'"
linea8="alias lt='eza --tree --icons --color=auto --group-directories-first'"
linea9='eval "$(starship init zsh)"'
linea10=' '
linea10='# by JoseG'

# Agregar cada línea si no existe
echo " "
echo " "
for linea in "$linea0" "$linea1" "$linea2" "$linea3" "$linea4" "$linea5" "$linea6" "$linea7"  "$linea8"  "$linea9" "$linea10"; do
    if ! grep -Fxq "$linea" ~/.zshrc; then
        echo "$linea" >> ~/.zshrc
        echo "Agregado: $linea"
    else
        echo "Ya existía: $linea"
    fi
    echo " "
done
echo " "
echo " "

sed -i 's|^ZSH_THEME=.*|# ZSH_THEME="powerlevel10k/powerlevel10k"|' ~/.zshrc

starship preset catppuccin-powerline -o ~/.config/starship.toml



zsh
#zsh $(source ~/.zshrc)
