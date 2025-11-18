ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:12
FROM $BUILD_FROM

COPY run.sh /
COPY config.yaml /
COPY etc/ /etc/

RUN chmod a+x /run.sh /etc/services.d/ssl_sync/run /etc/services.d/ssl_sync/finish

# CMD/ENTRYPOINT не нужны, s6-overlay запустится сам как PID 1

