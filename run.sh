#!/bin/sh
set -e

# Правильные имена переменных в аддонах HAOS
SRC_REL="${OPTION_SOURCE_RELATIVE_PATH:-a0d7b954_nginxproxymanager/letsencrypt/live/npm-8}"
DEST_REL="${OPTION_DEST_RELATIVE_PATH:-nginxproxymanager/live/npm-1}"

# Фиксированные корни
SRC_ROOT="/addon_configs"
DEST_ROOT="/ssl"

SRC_DIR="$SRC_ROOT/$SRC_REL"
DEST_DIR="$DEST_ROOT/$DEST_REL"

echo "Пытаемся синхронизировать:"
echo "   Источник: $SRC_DIR"
echo "   Назначение: $DEST_DIR"

if [ ! -d "$SRC_DIR" ]; then
  echo "Source folder not found: $SRC_DIR"
  echo "Содержимое /addon_configs:"
  ls -la /addon_configs/ 2>/dev/null || echo "Папка /addon_configs недоступна (нет монтирования)"
  exit 1
fi

mkdir -p "$DEST_DIR"

cp -fv "$SRC_DIR/privkey.pem" "$DEST_DIR/"
cp -fv "$SRC_DIR/fullchain.pem" "$DEST_DIR/"

# Перезапуск Asterisk
if curl -s -f -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" \
   -X POST http://supervisor/addons/b35499aa_asterisk/restart; then
  echo "Asterisk restarted successfully"
else
  echo "Failed to restart Asterisk (не критично)"
fi

echo "SSL certificates synced successfully: $SRC_DIR → $DEST_DIR"
