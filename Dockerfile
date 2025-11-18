ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:12
FROM $BUILD_FROM

# Копируем файлы аддона
COPY run.sh /
COPY config.yaml /

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

