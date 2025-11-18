# SSL Sync Addon

Этот аддон синхронизирует SSL сертификаты Nginx Proxy Manager с Asterisk, полностью в рамках одного устройства HAOS.

## Настройки

- `source_relative_path`: относительный путь к сертификатам NPM (от /addon_configs)
- `dest_relative_path`: относительный путь назначения (от /ssl)

## Запуск

1. Установите аддон.
2. Настройте `source_relative_path` и `dest_relative_path`.
3. Запустите аддон.
4. Сертификаты скопируются и аддон Asterisk будет перезапущен.
