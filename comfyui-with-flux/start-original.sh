#!/bin/bash

echo "🔍 Поиск main.py и запуск ComfyUI..."

POSSIBLE_PATHS=(
  "/ComfyUI/main.py"
)

FOUND=""

for path in "${POSSIBLE_PATHS[@]}"; do
  if [ -f "$path" ]; then
    FOUND="$path"
    break
  fi
done

if [ -z "$FOUND" ]; then
  echo "❌ main.py не найден ни в одном из путей!"
  echo "Проверенные пути:"
  for path in "${POSSIBLE_PATHS[@]}"; do
    echo " - $path"
  done
  exit 1
fi

DIR=$(dirname "$FOUND")
echo "✅ Найден: $FOUND"
echo "🚀 Запуск из директории $DIR"

cd "$DIR"
exec python3 main.py
