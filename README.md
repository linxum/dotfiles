# linxum/dotfiles

Настройки и «dotfiles» для Windows Terminal, Oh My Posh и VS Code.

---

## 📋 Содержание

* [Описание](#-описание)
* [Требования](#-требования)
* [Установка](#-установка)
* [Использование](#-использование)
* [Структура репозитория](#-структура-репозитория)

---

## 📝 Описание

Этот репозиторий содержит ваши персональные конфигурации:

* **Windows Terminal**: `windows-terminal/settings.json`
* **Oh My Posh**: тема и профиль — `oh-my-posh/linxum.omp.json`
* **Visual Studio Code**: `vscode/settings.json` и рекомендуемые расширения

Это позволит быстро настроить новое рабочее место «из коробки».

---

## ⚙️ Требования

1. **Git**
2. **Windows Terminal** (версии ≥ 1.13)
3. **PowerShell 7+**
4. **Oh My Posh** (версии ≥ 3.0):

   ```powershell
   Install-Module oh-my-posh -Scope CurrentUser
   ```
5. **Visual Studio Code**

   * Расширения:

     * `ms-vscode.powershell`
     * `pkief.material-icon-theme`
     * `zhuangtongfa.material-theme`

---

## 🚀 Установка

Склонируйте репозиторий и запустите скрипт установки:

```bash
git clone https://github.com/linxum/dotfiles.git
cd dotfiles

# Для Bash/Zsh (Linux/macOS/WSL)
./install.sh

# Для PowerShell (Windows)
.\install.ps1
```

Скрипты создадут символические ссылки (symlinks) в нужных директориях и проверят наличие зависимостей.

---

## 🎯 Использование

1. Откройте **Windows Terminal** — ваши профили и тема Oh My Posh подключатся автоматически.
2. Запустите **VS Code** и убедитесь, что настройки и рекомендуемые расширения применились.
3. При желании отредактируйте:

   * `oh-my-posh/linxum.omp.json` — цвета и шрифты в теме терминала
   * `vscode/settings.json` — свои пользовательские опции

---

## 📂 Структура репозитория

```
/
├── README.md
├── install.sh
├── install.ps1
├── oh-my-posh/
│   └── linxum.omp.json
├── vscode/
│   ├── settings.json
│   └── extensions.json
└── windows-terminal/
    └── settings.json
```
