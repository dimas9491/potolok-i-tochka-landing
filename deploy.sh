#!/usr/bin/env bash
# =============================================================
# Деплой на Beget — potolok-i-tochka.ru
# Использование: ./deploy.sh
# =============================================================
set -e

HOST="verbov1j@verbov1j.beget.tech"
# Когда domain потолок-i-tochka.ru будет привязан, поменять путь:
REMOTE_PATH="potolok-i-tochka.ru/public_html/"
# Текущий (на поддомене):
# REMOTE_PATH="verbov1j.beget.tech/public_html/"

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "===> Деплоим из $LOCAL_DIR на $HOST:$REMOTE_PATH"

rsync -avz --no-perms --no-owner --no-group --omit-dir-times --delete \
  --include='*.html' \
  --include='*.png' \
  --include='*.jpg' \
  --include='*.jpeg' \
  --include='*.webp' \
  --include='*.svg' \
  --include='*.ico' \
  --include='*.css' \
  --include='*.js' \
  --include='.htaccess' \
  --include='robots.txt' \
  --include='sitemap.xml' \
  --include='favicon.ico' \
  --exclude='*' \
  "$LOCAL_DIR/" \
  "$HOST:$REMOTE_PATH"

echo ""
echo "===> Готово. Проверь:"
echo "     https://potolok-i-tochka.ru/"
