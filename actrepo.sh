#!/bin/bash

#   Este script actualizará los archivos de tu repositorio en github


# La ruta del proyecto
ruta_proyecto="/home/jguerra/Documents/Mscripts"

cd /home/jguerra/Documents/Mscripts
echo "Ahora estás en: $(pwd)"

git status

git add .

read -rp "Digite mensaje descriptivo para commit: " messss

git commit -m $messss

nrama="$(git branch)"

git push origin nrama

