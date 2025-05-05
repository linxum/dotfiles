# Установка и настройка dotfiles (Windows PowerShell)

Param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

# Директория скрипта
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

function Link-Item {
    param(
        [Parameter(Mandatory)] [string]$Source,
        [Parameter(Mandatory)] [string]$Destination
    )
    if (Test-Path $Destination) {
        Write-Host "[INFO] Удаляю существующий $Destination"
        Remove-Item -Path $Destination -Recurse -Force
    }
    Write-Host "[INFO] Линкуем $Source -> $Destination"
    New-Item -ItemType SymbolicLink -Path $Destination -Value $Source | Out-Null
}

# Проверка Git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git не найден. Установите Git и повторите.";
    exit 1
}

# Проверка Oh My Posh
if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    Write-Host "[INFO] Устанавливаю Oh My Posh..."
    Install-Module oh-my-posh -Scope CurrentUser -Force
}

# Директория тем Posh
$PoshThemesDir = Join-Path $Env:USERPROFILE ".poshthemes"
if (-not (Test-Path $PoshThemesDir)) { New-Item -ItemType Directory -Path $PoshThemesDir | Out-Null }
Link-Item -Source (Join-Path $ScriptDir "oh-my-posh\linxum.omp.json") -Destination (Join-Path $PoshThemesDir "linxum.omp.json")

# Windows Terminal
$WTSettingsDir = Join-Path $Env:LOCALAPPDATA "Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
if (Test-Path $WTSettingsDir) {
    Link-Item -Source (Join-Path $ScriptDir "windows-terminal\settings.json") -Destination (Join-Path $WTSettingsDir "settings.json")
}

# VSCode
$VSCodeUserDir = Join-Path $Env:APPDATA "Code\User"
if (-not (Test-Path $VSCodeUserDir)) { New-Item -ItemType Directory -Path $VSCodeUserDir | Out-Null }
Link-Item -Source (Join-Path $ScriptDir "vscode\settings.json") -Destination (Join-Path $VSCodeUserDir "settings.json")
Link-Item -Source (Join-Path $ScriptDir "vscode\extensions.json") -Destination (Join-Path $VSCodeUserDir "extensions.json")

Write-Host "[SUCCESS] Установка завершена!"