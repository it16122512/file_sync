# Используем базовый образ HAOS
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:12
FROM $BUILD_FROM

# Копируем файлы аддона
COPY run.sh /
COPY config.yaml /

# Устанавливаем curl для Supervisor API
RUN apk add --no-cache curl

# Делаем скрипт исполняемым
RUN chmod a+x /run.sh

# Запускаем напрямую без s6-overlay сложностей
CMD ["/run.sh"]
