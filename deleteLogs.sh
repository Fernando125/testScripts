#!/bin/bash

# Directorio donde se encuentran los archivos
directorio="/ruta_del_directorio"

# Encuentra y elimina los logs con mas de 7 dias
find "$directorio" -type f -mtime +7 -exec rm {} \;

echo "Operacion completada: Se han eliminado los logs con mas de 7 dias"
