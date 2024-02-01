#!/bin/bash

# Directorio donde se encuentran los archivos
directorio="/c/Users/Profesional/Documents/testScripts"
fecha=$(date +'%d%m%Y')

# Encuentra y elimina los logs con mas de 7 dias
find "$directorio" -type f -mtime +7 -exec rm {} \;

find "$directorio" -type f -name "*.log" -ctime -7 -exec zip logs-$fecha.zip {} +

echo "Se han eliminado los logs con mas de 7 dias"