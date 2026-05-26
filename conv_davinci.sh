#!/usr/bin/env bash

# Verificar si hay archivos mp4 en el directorio actual
shopt -s nullglob
archivos=(*.mp4)

if [ ${#archivos[@]} -eq 0 ]; then
    echo "❌ No se encontraron archivos .mp4 en este directorio."
    exit 1
fi

echo "🚀 Iniciando conversión en paralelo de ${#archivos[@]} videos..."

# Ejecuta hasta 3 conversiones simultáneas usando xargs
printf '%s\0' "${archivos[@]}" | xargs -0 -I {} -P 3 sh -c '
    input="{}"
    output="${input%.*}.mov"
    echo "⏳ Convirtiendo: $input -> $output"
    ffmpeg -y -v error -i "$input" -c:v prores_ks -profile:v 1 -c:a pcm_s16le "$output"
    echo "✅ Finalizado: $output"
'

echo "🎉 ¡Todos los videos han sido procesados!"
