#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="vi3ecode"
REPO_URL="https://github.com/AYASCELL/vi3ecode-arch/releases/download/x86_64"
PACMAN_CONF="/etc/pacman.conf"

if [[ $EUID -ne 0 ]]; then
    echo "Bu betik root yetkisi gerektirir. 'sudo' ile yeniden çalıştırılıyor..."
    exec sudo "$0" "$@"
fi

if grep -q "^\[${REPO_NAME}\]" "${PACMAN_CONF}"; then
    echo "==> [${REPO_NAME}] deposu ${PACMAN_CONF} içinde zaten tanımlı."
else
    echo "==> [${REPO_NAME}] deposu ${PACMAN_CONF} dosyasına ekleniyor..."
    cat <<EOF >> "${PACMAN_CONF}"

[${REPO_NAME}]
SigLevel = Optional TrustAll
Server = ${REPO_URL}
EOF
    echo "==> Depo başarıyla eklendi!"
fi

echo "==> Paket veritabanları senkronize ediliyor ve vi3ecode-bin kuruluyor..."
pacman -Syu --needed --noconfirm vi3ecode-bin
