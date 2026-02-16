#!/bin/bash

# ==============================
# Renombrador masivo de imágenes
# ==============================

# Verificar que el usuario pase al menos el número inicial
if [ -z "$1" ]; then
    echo "Uso: $0 <numero_inicial> [prefijo]"
    echo "Ejemplo: $0 10 imagen_"
    exit 1
fi

numero=$1
prefijo=${2:-img_}  # Si no se pasa prefijo, usa "img_"

# Extensiones soportadas
extensiones=("jpg" "jpeg" "png" "webp" "gif" "bmp" "JPG" "JPEG" "PNG")

for archivo in *; do
    # Verificar que sea archivo regular
    if [ -f "$archivo" ]; then
        extension="${archivo##*.}"

        for ext in "${extensiones[@]}"; do
            if [ "$extension" = "$ext" ]; then
                nuevo_nombre="${prefijo}${numero}.${extension}"

                # Evitar sobrescribir archivos
                if [ -e "$nuevo_nombre" ]; then
                    echo "⚠️  $nuevo_nombre ya existe, saltando..."
                else
                    mv "$archivo" "$nuevo_nombre"
                    echo "Renombrado: $archivo → $nuevo_nombre"
                    ((numero++))
                fi
                break
            fi
        done
    fi
done

echo "✅ Proceso terminado."

