FROM debian:bullseye-slim

# Instalar dependencias
RUN apt-get update && \
    apt-get install -y curl cron && \
    apt-get clean

# Copiar el script de ping y el cronjob
COPY ping.sh /usr/local/bin/ping.sh
COPY cronjob /etc/cron.d/ping-cron

# Dar permisos de ejecución
RUN chmod +x /usr/local/bin/ping.sh && \
    chmod 0644 /etc/cron.d/ping-cron && \
    crontab /etc/cron.d/ping-cron

# Crear log file
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log
