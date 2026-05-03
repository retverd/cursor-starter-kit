#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-}"

if [ -z "$TARGET_DIR" ]; then
  echo "Использование: ./scripts/bootstrap.sh /путь/к/проекту"
  exit 1
fi

mkdir -p "$TARGET_DIR/.cursor"
mkdir -p "$TARGET_DIR/docs"

cp -R ./.cursor/rules "$TARGET_DIR/.cursor/"
cp -R ./docs/architecture "$TARGET_DIR/docs/"
cp -R ./docs/components "$TARGET_DIR/docs/"
cp -R ./docs/workflows "$TARGET_DIR/docs/"
cp -R ./docs/templates "$TARGET_DIR/docs/"
cp ./.gitignore "$TARGET_DIR/" || true

cat <<MSG
Инициализация завершена.

Следующие шаги:
1. Проверьте и сократите правила под проект.
2. Заполните docs/architecture/overview.md.
3. Заполните docs/components/*.
4. Адаптируйте glob-шаблоны под реальную структуру репозитория.
MSG