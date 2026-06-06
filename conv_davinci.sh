#!/usr/bin/env bash

# Verificar si hay archivos mp4 en el directorio actual
shopt -s nullglob
archivos=(*.mp4)

if [ ${#archivos[@]} -eq 0 ]; then
    echo "❌ No se encontraron archivos .mp4 en este directorio."
    exit 1
fi

echo "🚀 Iniciando conversión en paralelo de ${#archivos[@]} videos..."
echo ""

# Limpiar archivo de registro de errores anterior si existe
rm -f conv_davinci_errors.log

# Crear una tubería nombrada (FIFO) para comunicación entre procesos
FIFO=$(mktemp -u)
mkfifo "$FIFO"

# Asegurar limpieza al salir o interrumpir
cleanup() {
    pids=$(jobs -p)
    if [ -n "$pids" ]; then
        kill $pids 2>/dev/null
    fi
    rm -f "$FIFO"
}
trap cleanup EXIT INT TERM

# Inicializar estados de los archivos
# Estados posibles: PENDING (⚪), RUNNING (⏳), DONE (✅), FAILED (❌)
declare -a status
for i in "${!archivos[@]}"; do
    status[i]="PENDING"
done

# Función para dibujar la lista de archivos con sus estados
first_draw=true
draw_list() {
    # Si no es el primer dibujo, mover el cursor hacia arriba para sobreescribir la lista
    if [ "$first_draw" = false ]; then
        printf "\033[%dA" "${#archivos[@]}"
    fi
    first_draw=false

    for i in "${!archivos[@]}"; do
        local file="${archivos[i]}"
        case "${status[i]}" in
            "PENDING")
                printf "\r\033[K  ⚪  %s\n" "$file"
                ;;
            "RUNNING")
                printf "\r\033[K  ⏳  \e[33m%s\e[0m\n" "$file"
                ;;
            "DONE")
                printf "\r\033[K  ✅  \e[32m%s\e[0m\n" "$file"
                ;;
            "FAILED")
                printf "\r\033[K  ❌  \e[31m%s\e[0m\n" "$file"
                ;;
        esac
    done
}

# Dibujar la lista de archivos con estado inicial
draw_list

# Lanzador de conversiones en segundo plano - Todo su output va al FIFO
(
    # Desactivar trampas en el subproceso del lanzador
    trap - EXIT INT TERM

    active_jobs=0
    for i in "${!archivos[@]}"; do
        # Limitar a un máximo de 3 trabajos en paralelo
        while [ $active_jobs -ge 3 ]; do
            wait -n
            active_jobs=$((active_jobs - 1))
        done

        # Ejecutar la conversión de un archivo individual en segundo plano
        (
            trap - EXIT INT TERM
            echo "$i START"
            
            input="${archivos[i]}"
            output="${input%.*}.mov"
            
            # Ejecutar ffmpeg y registrar errores si falla
            if ffmpeg -y -v error -i "$input" -c:v prores_ks -profile:v 1 -c:a pcm_s16le "$output" 2>> conv_davinci_errors.log; then
                echo "$i END_SUCCESS"
            else
                echo "$i END_FAILURE"
            fi
        ) &
        active_jobs=$((active_jobs + 1))
    done
    wait # Esperar a que terminen los trabajos restantes
    echo "ALL DONE"
) > "$FIFO" &

# Leer eventos de la FIFO y actualizar la interfaz en tiempo real
any_failed=false
while read -r index event; do
    if [ "$index" = "ALL" ] && [ "$event" = "DONE" ]; then
        break
    fi

    # Actualizar estado de acuerdo al evento recibido
    if [ "$event" = "START" ]; then
        status[index]="RUNNING"
    elif [ "$event" = "END_SUCCESS" ]; then
        status[index]="DONE"
    elif [ "$event" = "END_FAILURE" ]; then
        status[index]="FAILED"
        any_failed=true
    fi

    draw_list
done < "$FIFO"

echo ""
if [ "$any_failed" = true ]; then
    echo "🎉 ¡Conversión finalizada! (Algunos archivos fallaron, ver detalles en: conv_davinci_errors.log)"
else
    # Limpiar el archivo de error vacío si no hubo fallos
    rm -f conv_davinci_errors.log
    echo "🎉 ¡Todos los videos han sido procesados con éxito!"
fi
