#!/bin/bash

papelerafil="/home/jguerra/.local/share/Trash/files"
papelerainf="/home/jguerra/.local/info/Trash/info"

if [ "$(ls -A $papelerafil)" ]; then
  echo "Hay archivos para borrar"
else
  echo "La papelera ya está vacía"
  exit 1
fi

rm -rf $papelerafil*
rm -rf $papelerainf*

echo "Papelera ha sido vaciada... "
echo " "

mkdir "/home/jguerra/.local/share/Trash/files"
chmod +x "/home/jguerra/.local/share/Trash/files"

