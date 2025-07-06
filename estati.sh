#!/bin/bash

# ╔════════════════════════════════════════════════════╗
# ║              MONITOR DE SISTEMA BÁSICO            ║
# ╚════════════════════════════════════════════════════╝

echo -e "\n📅 Fecha y hora:"
date "+%A, %d, %B, %Y - %H:%M:%S"

echo -e "\n🧠 Memoria RAM:"
free -h | awk '/Mem:/ {print "Total: " $2 "\nUsada: " $3 "\nLibre: " $4}'

echo -e "\n💾 Espacio en disco (/):"
df -h / | awk 'NR==2 {print "Total: " $2 "\nUsado: " $3 "\nLibre: " $4}'

echo -e "\n🌐 Dirección IP:"
ip a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | cut -d/ -f1

echo -e "\n🌡️ Temperatura de la CPU:"
sensors | grep -E 'Core|Package' || echo "⚠️ Comando 'sensors' no configurado. Ejecuta 'sudo sensors-detect' y luego 'sensors'"

echo -e "\n⏱️ Tiempo de actividad del sistema:"
uptime -p

echo -e "\n🔋 Batería:"
upower -i $(upower -e | grep BAT) | grep -E "state|percentage|time to"

echo -e "\n✅ Fin del reporte.\n"

