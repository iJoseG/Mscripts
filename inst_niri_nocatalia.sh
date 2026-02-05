#!/bin/bash

set -e

### GPU detection ###
GPU=$(lspci | grep -E "VGA|3D")
if echo "$GPU" | grep -qi intel; then
  sudo pacman -S --needed --noconfirm mesa intel-media-driver vulkan-intel
elif echo "$GPU" | grep -qi amd; then
  sudo pacman -S --needed --noconfirm mesa vulkan-radeon
elif echo "$GPU" | grep -qi nvidia; then
  sudo pacman -S --needed --noconfirm nvidia nvidia-utils
fi

### Instalacion de paquetes #
sudo pacman -S --needed --noconfirm \
niri xdg-desktop-portal-gnome \
wayland wayland-protocols xorg-xwayland \
pipewire wireplumber \
xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk \
gdm alacritty git curl 

# Script para instalar yay
bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/instyay.sh)

#### WaylandEnable=true 
#### en /etc/gdm/custom.conf
### Enable Wayland in GDM ###
sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=true/' /etc/gdm/custom.conf

### Enable GDM ###
sudo systemctl enable gdm

yay -S --needed --noconfirm quickshell brightnessctl git imagemagick python ddcutil cliphist cava wlsunset xdg-desktop-portal python3 evolution-data-server 
