#!/bin/bash

# Directorio donde se encuentran los archivos
directorio="."

# Encuentra y elimina archivos con más de 7 días de antigüedad
find "$directorio" -type f -mtime +7 -exec rm {} \;

# Notifico al usuario que los logs de los ultimos 7 dias han sido eliminados
echo "Se han borrado los logs de hace mas de 7 dias"