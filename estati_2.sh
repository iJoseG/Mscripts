#!/bin/bash

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃      MONITOR DE SISTEMA BÁSICO      ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

# Colores ANSI
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

print_section() {
    echo -e "\n${CYAN}╔══════════════════════════════════════════════╗"
    echo -e "║ $1"
    echo -e "╚══════════════════════════════════════════════╝${RESET}"
}

clear
echo -e "${YELLOW}╭──────────────────────────────────────────────╮"
echo -e "│      ${GREEN}MONITOR DE SISTEMA - ARCH LINUX${YELLOW}         │"
echo -e "╰──────────────────────────────────────────────╯${RESET}"

# Fecha y hora
print_section "📅 Fecha y hora:"
date "+%A %d de %B de %Y - %H:%M:%S"

# RAM
print_section "🧠 Memoria RAM:"
free -h | awk '/Mem:/ {printf "Total: %s\nUsada: %s\nLibre: %s\n", $2, $3, $4}'

# Disco
print_section "💾 Espacio en disco (/):"
df -h / | awk 'NR==2 {printf "Total: %s\nUsado: %s\nLibre: %s\n", $2, $3, $4}'

# Temperatura
print_section "🌡️ Temperatura de la CPU:"
sensors | grep -E 'Core|Package' || echo "⚠️ Ejecuta: sudo sensors-detect"

# Uptime
print_section "⏱️ Tiempo de actividad:"
uptime -p

# Batería
print_section "🔋 Batería:"
upower -i $(upower -e | grep BAT) | grep -E "state|percentage|time to"

echo -e "\n${GREEN}✔ Reporte completado.${RESET}"
