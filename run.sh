#!/bin/sh
set -e

SRC_REL="${SOURCE_RELATIVE_PATH}"
DEST_REL="${DEST_RELATIVE_PATH}"

# Фиксированные корни
SRC_ROOT="/addon_configs"
DEST_ROOT="/ssl"

SRC_DIR="$SRC_ROOT/$SRC_REL"
DEST_DIR="$DEST_ROOT/$DEST_REL"

if [ ! -d "$SRC_DIR" ]; then
  echo "❌ Source folder not found: $SRC_DIR"
  exit 1
fi

mkdir -p "$DEST_DIR"

# Копируем сертификаты
cp -f "$SRC_DIR/privkey.pem" "$DEST_DIR/"
cp -f "$SRC_DIR/fullchain.pem" "$DEST_DIR/"

# Перезапуск Asterisk через Supervisor API
if curl -s -f -H "Authorization: Bearer $SUPERVISOR_TOKEN" \
   -X POST "http://supervisor/addons/b35499aa_asterisk/restart"; then
  echo "✅ Asterisk addon restarted successfully"
else
  echo "⚠️  Failed to restart Asterisk addon"
fi

echo "✅ SSL certificates synced: $SRC_DIR → $DEST_DIR"
