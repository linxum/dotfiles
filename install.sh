# Установка и настройка dotfiles (Linux/macOS/WSL)

#!/usr/bin/env bash
set -euo pipefail

# Определяем директорию скрипта
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Функция для создания символьной ссылки
link_file() {
  local src="$1"
  local dest="$2"
  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "[INFO] Удаляю существующий $dest"
    rm -rf "$dest"
  fi
  echo "[INFO] Линкуем $src -> $dest"
  ln -s "$src" "$dest"
}

# Проверяем зависимости
if ! command -v git &>/dev/null; then
  echo "[ERROR] Git не найден. Установите Git и повторите." >&2
  exit 1
fi

# Проверяем Oh My Posh
if ! command -v oh-my-posh &>/dev/null; then
  echo "[INFO] Oh My Posh не найден. Устанавливаю..."
  pwsh -Command "Install-Module oh-my-posh -Scope CurrentUser -Force"
fi

# Директория для тем Posh
POSH_THEMES_DIR="$HOME/.poshthemes"
mkdir -p "$POSH_THEMES_DIR"
link_file "$DOTFILES_DIR/oh-my-posh/linxum.omp.json" "$POSH_THEMES_DIR/linxum.omp.json"

# Настройки VSCode
VSCODE_DIR="$HOME/.config/Code/User"
mkdir -p "$VSCODE_DIR"
link_file "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_DIR/settings.json"
link_file "$DOTFILES_DIR/vscode/extensions.json" "$VSCODE_DIR/extensions.json"

echo "[SUCCESS] Установка завершена!"