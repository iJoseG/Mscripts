#!/bin/bash

#   Este script actualizará los archivos de tu repositorio en github


# La ruta del proyecto
ruta_proyecto="/home/jguerra/Documents/Mscripts"

cd "$ruta_proyecto" || { echo "Error: no se pudo acceder a la ruta $ruta_proyecto"; exit 1; }

if [[ -z $(git status --porcelain) ]]; then
    echo "No hay cambios por realizar. Saliendo..."
    exit 1
fi
git status
# echo "Ahora estás en: $(pwd)"

git add .
read -rp "Digite mensaje descriptivo para commit: " messss
git commit -m "$messss"
nrama="$(git branch)"
git push origin main

echo " "
echo " "

git status

