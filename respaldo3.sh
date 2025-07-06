

#!/bin/bash

echo "===============================================" 
echo "	    CREACION RESPALDO                        "
echo "==============================================="

# Pedir al usuario la carpeta de origen
read -rp " ° Ingresa la ruta de la carpeta a respaldar: " origen

# Verificar que exista la ruta

if [ ! -d "$origen" ]; then
	echo "La ruta ingresada no existe. Abortando ... "
	exit 1
fi

# Pedir la ruta de destino

read -rp " ° Ingresa la ruta de donde guardaras el respaldo: " destino

# Carpeta de origen
#origen="/home/jguerra/Documents/Mscripts"

# Carpeta de destino
#destino="/home/jguerra/Backup"

# Fecha actual en formato Día-Mes-Año_Hora-Minuto-Segundo
fecha=$(date +%d-%m-%y_%H-%M-%S)

# Nombre del archivo comprimido
archivo_respaldo="respaldo_$fecha.tar.gz"

# Pedir al usuario la cantidad de días de permanencia
read -rp " ° Ingrese la cantidad de dias de permanencia del respaldo: " dias

# Eliminar respaldos .tar.gz en mas de X dias
echo "Eliminando respaldo antiguo en $destino (más de $dias días) ..."
find "$destino" -name "*.tar.gz" -type f -mtime +"$dias" -exec rm {} \;

# Crear carpeta de respaldo si no existe
mkdir -p "$destino"

echo $origen
echo $destino
echo $fecha
echo $archivo_respaldo

# Crear el archivo comprimido
tar -czf "$destino/$archivo_respaldo" -C "$origen" .

echo "Respaldo creado exitosamente en $destino/$archivo_respaldo"

