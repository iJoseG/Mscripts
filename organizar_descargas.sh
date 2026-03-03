#!/bin/bash

# ==============================================================================
# Script: organizar_descargas.sh
# Descripción: Automatiza la organización de la carpeta de Descargas.
# Autor: Antigravity AI
# ==============================================================================

# Colores para una salida premium
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
BOLD='\033[1m'

TARGET_DIR="$HOME/Downloads"

# Verificar existencia del directorio
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "${YELLOW}Advertencia:${NC} El directorio $TARGET_DIR no existe."
    exit 1
fi

echo -e "${BOLD}${BLUE}==> Iniciando organización de: $TARGET_DIR <==${NC}"

# Cambiar al directorio de descargas
cd "$TARGET_DIR" || exit

# Función para mover archivos de forma segura (evita sobreescritura)
move_file() {
    local file="$1"
    local dest_folder="$2"

    # Crear el directorio si no existe
    mkdir -p "$dest_folder"

    local filename=$(basename -- "$file")
    local extension="${filename##*.}"
    local filename_no_ext="${filename%.*}"
    
    # Si el archivo no tiene extensión, ajustar variables
    if [[ "$filename" == "$extension" ]]; then
        extension=""
    fi

    local new_name="$filename"
    local counter=1

    # Lógica de colisión
    while [ -f "$dest_folder/$new_name" ]; do
        if [[ -n "$extension" ]]; then
            new_name="${filename_no_ext}_${counter}.${extension}"
        else
            new_name="${filename_no_ext}_${counter}"
        fi
        ((counter++))
    done

    mv "$file" "$dest_folder/$new_name"
    echo -e "  [${GREEN}OK${NC}] ${CYAN}$filename${NC} -> ${BLUE}$dest_folder/$new_name${NC}"
}

# Habilitar globbing insensible a mayúsculas
shopt -s nocaseglob

# Contador de archivos movidos
count=0

# Iterar sobre cada archivo en el directorio
for file in *; do
    # Saltar si es un directorio o si es un archivo oculto (opcional)
    [[ -d "$file" ]] && continue
    [[ "$file" == .* ]] && continue
    
    # Categorización por extensión
    case "$file" in
        *.jpg|*.jpeg|*.png|*.gif|*.svg|*.webp|*.bmp|*.ico|*.jfif)
            move_file "$file" "Imagenes"
            ((count++))
            ;;
        *.mp4|*.mkv|*.avi|*.mov|*.flv|*.wmv|*.webm|*.m4v)
            move_file "$file" "Videos"
            ((count++))
            ;;
        *.pdf|*.docx|*.doc|*.txt|*.pptx|*.xlsx|*.odt|*.csv|*.epub|*.md|*.rtf)
            move_file "$file" "Documentos"
            ((count++))
            ;;
        *.c|*.cpp|*.h|*.hpp|*.java|*.class|*.jar|*.py|*.ipynb|*.js|*.ts|*.html|*.css|*.php|*.sql|*.json|*.xml|*.yaml|*.yml|*.go|*.rs|*.rb|*.kt|*.dart|*.sh|*.bat|*.ps1)
            move_file "$file" "Programacion"
            ((count++))
            ;;
        *.mp3|*.wav|*.flac|*.aac|*.m4a|*.ogg|*.wma)
            move_file "$file" "Audio"
            ((count++))
            ;;
        *.zip|*.tar.gz|*.rar|*.7z|*.bz2|*.xz|*.gz|*.tar|*.tgz)
            move_file "$file" "Comprimidos"
            ((count++))
            ;;
        *.deb|*.rpm|*.appimage|*.exe|*.msi)
            move_file "$file" "Instaladores"
            ((count++))
            ;;
        *.iso|*.img|*.bin|*.vmdk|*.ova)
            move_file "$file" "ISO_y_ROMs"
            ((count++))
            ;;
        *)
            move_file "$file" "Otros"
            ((count++))
            ;;
    esac
done

if [ "$count" -eq 0 ]; then
    echo -e "${YELLOW}No se encontraron archivos para organizar.${NC}"
else
    echo -e "\n${BOLD}${GREEN}¡Éxito!${NC} Se han organizado ${BOLD}$count${NC} archivos."
fi

shopt -u nocaseglob
