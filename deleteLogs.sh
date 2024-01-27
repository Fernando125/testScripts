#!/bin/bash

# Directorio donde se encuentran los archivos
DIRECTORIO="/ruta/del/directorio/de/archivos"

# Encuentra y elimina archivos con más de 7 días de antigüedad
find "$DIRECTORIO" -type f -mtime +7 -exec rm {} \;

echo "Operación completada: Se han eliminado los archivos con más de 7 días de antigüedad."