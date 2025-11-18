# Используем базовый образ HAOS
ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:12
FROM $BUILD_FROM

# Копируем файлы аддона
COPY run.sh /
COPY config.yaml /
COPY etc/ /etc/

# Делаем исполняемыми нужные файлы
RUN chmod a+x /run.sh \
    && chmod a+x /etc/services.d/ssl_sync/run \
    && chmod a+x /etc/services.d/ssl_sync/finish

# CMD удаляем — s6-overlay автоматически запустит ваш сервис
# CMD [ "/run.sh" ]  <- Удаляем!
