#!/bin/bash

set -e

echo " "
echo "Se requieren permisos de superusuario..."
sudo -v

spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'

    while ps a | awk '{print $1}' | grep -q "$pid"; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

echo " "
echo "Instalando paquetes necesarios..."
sudo apt install -y wget > /dev/null 2>&1 &
spinner
echo " ✔"

cd "$HOME"

echo " "
echo "Descargando paquete mpm..."
wget https://www.mathworks.com/mpm/glnxa64/mpm > /dev/null 2>&1 &
spinner
echo " ✔"

sudo chmod +x mpm

echo " "
echo "Instalando matlab R2025a..."
./mpm install \
  --release=R2025a \
  --destination="$HOME/matlab/R2025a" \
  --products \
  MATLAB Simulink \
  > /dev/null 2>&1 &
spinner
echo " ✔"

echo " "
echo "Ejecutando archivo de activacion de producto..."
sudo "$HOME"/matlab/R2025a/bin/glnxa64/./MathWorksProductAuthorizer.sh
echo " ✔"

echo " "
echo "Creando archivo de acceso directo..."

##############
# Creacion de acceso directo .desktop para matlab

# === Configuración ===
MATLAB_DIR="$HOME/matlab/R2025a"
DESKTOP_FILE="$HOME/.local/share/applications/matlab-r2025a.desktop"
EXEC="$MATLAB_DIR/bin/matlab"

# Posibles iconos (se prueba en orden)
ICON_CANDIDATES=(
  "$MATLAB_DIR/bin/glnxa64/cef_resources/matlab_icon.png"
  "$MATLAB_DIR/bin/glnxa64/icons/matlab.png"
)

# === Comprobaciones ===
if [[ ! -x "$EXEC" ]]; then
  echo "❌ No se encontró el ejecutable de MATLAB en:"
  echo "   $EXEC"
  exit 1
fi

# Buscar icono válido
ICON=""
for candidate in "${ICON_CANDIDATES[@]}"; do
  if [[ -f "$candidate" ]]; then
    ICON="$candidate"
    break
  fi
done

# Si no hay icono, usar uno genérico
if [[ -z "$ICON" ]]; then
  ICON="applications-science"
fi

# Crear directorio si no existe
mkdir -p "$(dirname "$DESKTOP_FILE")"

# === Crear archivo .desktop ===
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Type=Application
Name=MATLAB R2025a
Comment=MATLAB R2025a
Exec=$EXEC -desktop
Icon=$ICON
Terminal=false
Categories=Development;Science;Math;
StartupNotify=true
EOF

# Permisos
sudo chmod +x "$DESKTOP_FILE"
echo " ✔"

echo " "
echo " ✔ Matlab R2025a instalado correctamente!"
echo " "
