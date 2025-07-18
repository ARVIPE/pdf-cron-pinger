#!/bin/bash
echo "$(date) - Haciendo curl a la URL..."
curl -s https://app-pdf-to-excel.onrender.com || echo "Fallo la petición"
