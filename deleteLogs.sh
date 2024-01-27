#!/bin/bash

# Directorio del que se borraran los logs
directorio="./"

# Encuentra y elimina archivos con más de 7 días de antigüedad
find "$DIRECTORIO" -type f -mtime +7 -exec rm {} \;

echo "Se han borrado los logs de hace mas de 7 dias"