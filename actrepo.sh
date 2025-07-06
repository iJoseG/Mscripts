#!/bin/bash

#   Este script actualizará los archivos de tu repositorio en github

# La ruta del proyecto
ruta_proyecto="/home/jguerra/Documents/Mscripts"

cd "$ruta_proyecto" || { echo "Error: no se pudo acceder a la ruta $ruta_proyecto"; exit 1; }

if [[ -z $(git status --porcelain) ]]; then
    echo "No hay cambios por realizar. Saliendo..."
    exit 1
fi

# Observar el estado del repositorio
git status
# echo "Ahora estás en: $(pwd)"

# Agregar los archivos que no estén actualizados
git add .

# Recivir mensaje para ejecutar commit
read -rp "Digite mensaje descriptivo para commit: " messss
git commit -m "$messss"

# Obtenemos branch y publicamos cambios
nrama="$(git branch)"
git push origin $nrama

echo " "
echo " "

git status

