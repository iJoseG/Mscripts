#!/bin/bash

# Comprobar si se ejecuta como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root (sudo)."
   exit 1
fi

echo "--- Iniciando limpieza profunda del sistema ---"

# 1. Limpieza de caché de Pacman
# Mantiene solo las últimas 2 versiones de los paquetes instalados y elimina los no instalados.
if command -v paccache &> /dev/null; then
    echo "[*] Limpiando caché de paquetes (paccache)..."
    paccache -r -k 2
    paccache -ruk 0
else
    echo "[!] pacman-contrib no está instalado. Usando limpieza básica..."
    pacman -Sc --noconfirm
fi

# 2. Limpieza de paquetes huérfanos
# Elimina dependencias que ya no son necesarias por ningún paquete.
if [[ -n $(pacman -Qdtq) ]]; then
    echo "[*] Eliminando paquetes huérfanos..."
    pacman -Rs $(pacman -Qdtq) --noconfirm
else
    echo "[*] No hay paquetes huérfanos para eliminar."
fi

# 3. Limpieza de Systemd Journal
# Limita el tamaño de los logs a los últimos 2 días para liberar espacio en /var/log/journal.
echo "[*] Limpiando logs de Systemd Journal (últimos 2 días)..."
journalctl --vacuum-time=2d

# 4. Limpieza de caché de usuario (Opcional - solo si se ejecuta en entorno gráfico)
# Borra la caché de aplicaciones del usuario, como miniaturas o archivos temporales de navegadores.
echo "[*] Limpiando caché de usuario en /home/*/.cache ..."
rm -rf /home/*/.cache/*

echo "--- Limpieza completada con éxito ---"