# Используем простой Alpine вместо HA базового образа
FROM alpine:3.18

# Устанавливаем зависимости
RUN apk add --no-cache curl bash

# Копируем скрипты
COPY run.sh /
RUN chmod a+x /run.sh

# Запускаем напрямую
CMD ["/run.sh"]
