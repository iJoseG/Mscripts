#!/bin/bash

#   Este script actualizará los archivos de tu repositorio en github


# La ruta del proyecto
ruta_proyecto="/home/jguerra/Documents/Mscripts"

cd "$ruta_proyecto" || { echo "Error: no se pudo acceder a la ruta $ruta_proyecto"; exit 1; }

cd /home/jguerra/Documents/Mscripts

if [[ -z $(git status --porcelain) ]]; then
    echo " "
    echo "No hay cambios para hacer commit. Saliendo..."
    exit 1
fi

echo "Ahora estás en: $(pwd)"

git add .

read -rp "Digite mensaje descriptivo para commit: " messss

git commit -m "$messss"

nrama="$(git branch)"

git push origin main

git status

