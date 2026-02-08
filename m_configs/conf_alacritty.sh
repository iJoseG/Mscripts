#!/bin/bash

sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd
fc-cache -fv

mkdir -p ~/.config/alacritty

cat << 'EOF' > ~/.config/alacritty/alacritty.toml
# ===== CONFIGS ALACRITTY =====

[general]
import = ["~/.config/alacritty/themes/noctalia.toml"]

[font]
size = 12

[font.normal]
family = "JetBrainsMono Nerd Font"
style = "Regular"

[cursor]
style = { shape = "Beam", blinking = "On" }
thickness = 0.15
#style = "Beam"      # Block | Underline | Beam
#blinking = "On"         # On | Off | Always | Never

[window]
opacity = 0.8
decorations = "None"

[window.padding]
x = 10
y = 8
EOF
