#!/bin/bash

while true; do
  echo "$(date) - Haciendo petición a la URL..."
  curl -s https://app-pdf-to-excel.onrender.com || echo "Fallo la petición"
  echo "Esperando 10 minutos..."
  sleep 600
done
