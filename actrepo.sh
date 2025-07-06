#!/bin/bash

# Este script actualizará los archivos de tu repositorio en GitHub

# Colores ANSI
RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo -e "\n${CYAN}= o = o = o = o = o = o = o = o = o = o = o = o = o ="
echo -e "\n      ACTUALIZANDO REPOSITORIO by jguerra"
echo -e "\n= o = o = o = o = o = o = o = o = o = o = o = o = o =${RESET}\n"

# La ruta del proyecto donde está configurado git
ruta_proyecto="$(pwd)"

cd "$ruta_proyecto" || { echo -e "${RED}Error: no se pudo acceder a la ruta $ruta_proyecto ${RESET}"; exit 1; }

# Verificar si es un repositorio git válido
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo -e "${RED}Error: Esta carpeta no es un repositorio de Git.${RESET}"
    exit 1
fi

# Verificar si hay cambios por hacer
if [[ -z $(git status --porcelain) ]]; then
    echo "${GREEN}No hay cambios por realizar. Saliendo... ${RESET}\N"
    exit 0
fi

# Observar el estado del repositorio
git status

# Agregar los archivos modificados
git add .

# Recibir mensaje para ejecutar commit
echo -e "${YELLOW}Digite mensaje descriptivo para commit${RESET}"
read -rp ": " messss
git commit -m "$messss"

echo " "

# Obtenemos branch y publicamos cambios
nrama="$(git branch --show-current)"
git push origin "$nrama"

echo " "
echo -e "\n${GREEN}✔ Cambios subidos exitosamente a la rama '$nrama'.${RESET}"
echo " "
