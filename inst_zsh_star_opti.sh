#!/bin/bash

echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = o "
echo " "
echo " "
echo "      INSTALANDO ZSH + Starship-prompt by jguerra"
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o = o = o = o"

sleep 1
echo " "
# Instalar paquetes base
sudo pacman -S --needed --noconfirm git zsh nano curl eza fastfetch fzf

# Instalacion de JetBrainsMono Nerd Font
echo "Instalando JetBrainsMono Nerd Font..."
sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd
fc-cache -fv

echo "✔ JetBrainsMono Nerd Font está listo."

echo " "

echo " "
echo "Instalando Starship..."
curl -sS https://starship.rs/install.sh | sh
echo " "

echo " "
echo "Instalando herramientas de zsh..."
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo " "
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
echo " "
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
echo " "
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
echo " "
git clone https://github.com/rupa/z.git ~/.zsh/z
echo " "

cat << 'EOF' > ~/.zshrc

# =====================================
# HISTORIAL
# =====================================

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# =====================================
# COMPLETION
# =====================================

autoload -Uz compinit
fpath=(~/.zsh/zsh-completions/src $fpath)
compinit -d ~/.zcompdump

# Ignorar mayúsculas/minúsculas en autocompletado
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*'

setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

#zmodload zsh/zprof

# =====================================
# ALIASES
# =====================================

alias deit="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/datetoday.sh)"
alias actrepo="bash <(curl -sL https://raw.githubusercontent.com/iJoseG/Mscripts/refs/heads/main/actrepo.sh)"

alias l='eza -l --icons --color=auto --group-directories-first'
alias ls='eza --icons --color=auto --group-directories-first'
alias ll='eza -l --icons --color=auto --group-directories-first'
alias la='eza -la --icons --color=auto --group-directories-first'
alias lt='eza --tree --icons --color=auto --group-directories-first'

# =====================================
# PROMPT
# =====================================

eval "$(starship init zsh)"

# =====================================
# PLUGINS
# =====================================

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# History substring
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History search
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# z navigation
source ~/.zsh/z/z.sh

# =====================================
# FASTFETCH SOLO INTERACTIVO
# =====================================

[[ $- == *i* ]] && fastfetch

# by JoseG
EOF

echo " "

echo "Estableciendo preset de starship: catppuccin-powerline..."
starship preset catppuccin-powerline -o ~/.config/starship.toml

echo " "
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o ="
echo " "
echo " "
echo "      Instalacion Finalizada ...by jguerra           "
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o ="

zsh