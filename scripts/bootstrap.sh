#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-}"

if [ -z "$TARGET_DIR" ]; then
  echo "Использование: ./scripts/bootstrap.sh /путь/к/проекту"
  exit 1
fi

mkdir -p "$TARGET_DIR/.cursor"

cp -R ./.cursor/rules "$TARGET_DIR/.cursor/"
cp -R ./docs "$TARGET_DIR/"
cp ./README.adoc "$TARGET_DIR/"
cp ./.gitignore "$TARGET_DIR/" || true

cat <<MSG
Инициализация завершена.

Следующие шаги:
1. Заполните docs/antora.yml: name, title и version.
2. Заполните docs/modules/ROOT/pages/architecture/overview.adoc.
3. Проверьте docs/modules/ROOT/nav.adoc.
4. Зарегистрируйте репозиторий в центральном antora-playbook.yml через start_path: docs.
5. Проверьте и сократите правила Cursor под проект.
MSG