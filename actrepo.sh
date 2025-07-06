#!/bin/bash

# Este script actualizará los archivos de tu repositorio en GitHub

echo ""
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o ="
echo " "
echo " "
echo "      ACTUALIZANDO REPOSITORIO by jguerra"
echo " "
echo " "
echo "= o = o = o = o = o = o = o = o = o = o = o = o = o ="
echo " "

# La ruta del proyecto donde está configurado git
ruta_proyecto="$(pwd)"

cd "$ruta_proyecto" || { echo "Error: no se pudo acceder a la ruta $ruta_proyecto"; exit 1; }

# Verificar si es un repositorio git válido
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Error: Esta carpeta no es un repositorio de Git."
    exit 1
fi

# Verificar si hay cambios por hacer
if [[ -z $(git status --porcelain) ]]; then
    echo "No hay cambios por realizar. Saliendo..."
    echo " "
    exit 0
fi

# Observar el estado del repositorio
git status

# Agregar los archivos modificados
git add .

# Recibir mensaje para ejecutar commit
read -rp "Digite mensaje descriptivo para commit: " messss
git commit -m "$messss"

echo " "

# Obtenemos branch y publicamos cambios
nrama="$(git branch --show-current)"
git push origin "$nrama"

echo " "

git status

echo " "
echo "✅ Cambios subidos exitosamente a la rama '$nrama'."
echo " "
