#!/bin/bash

# Crear directorio data si no existe
mkdir -p data

# Crear archivo YAML directamente con la variable de entorno
echo "client_id: \"$ADSENSE_CLIENT_ID\"" > data/adsense.yaml

echo "✅ data/adsense.yaml creado exitosamente"
echo "Contenido:"
cat data/adsense.yaml

# Build con Hugo
hugo --gc --minify