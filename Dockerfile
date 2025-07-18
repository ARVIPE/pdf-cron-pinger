FROM python:3.12-slim

WORKDIR /app
COPY . .

# Instalar dependencias del sistema, incluyendo curl
RUN apt-get update && apt-get install -y curl && apt-get clean

# Instalar dependencias de Python
RUN pip install flask && chmod +x ping.sh

EXPOSE 10000
CMD ["python", "app.py"]
