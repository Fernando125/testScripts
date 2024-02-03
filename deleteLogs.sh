#!/bin/bash

# Directorio donde se encuentran los archivos
directorio="ruta_directorio"
fecha=$(date +'%d%m%Y')

# Encuentra y elimina los logs con mas de 7 dias
find "$directorio" -type f -mtime +7 -exec rm {} \;

find "$directorio" -type f -name "*.log" -ctime -7 -exec zip -q logs_$fecha.zip *.log \;

find "$directorio" -type f -name "*.log" -ctime -7 -exec rm {} \;

echo "Se han comprimido los logs con menos de 7 días y se han eliminado los logs con mas de 7 dias"
