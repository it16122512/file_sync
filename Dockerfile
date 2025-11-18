ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:12
FROM $BUILD_FROM

# Копируем файлы аддона
COPY run.sh /
COPY config.yaml /
COPY etc/ /etc/

RUN chmod a+x /run.sh /etc/services.d/ssl_sync/run /etc/services.d/ssl_sync/finish

