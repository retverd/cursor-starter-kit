param(
    [Parameter(Mandatory = $false)]
    [string]$TargetDir
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($TargetDir)) {
    Write-Output "Использование: .\scripts\bootstrap.ps1 C:\путь\к\проекту"
    exit 1
}

$cursorDir = Join-Path $TargetDir ".cursor"

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
New-Item -ItemType Directory -Force -Path $cursorDir | Out-Null

Copy-Item -Recurse -Force ".\.cursor\rules" $cursorDir
Copy-Item -Recurse -Force ".\docs" $TargetDir
Copy-Item -Force ".\README.adoc" $TargetDir

if (Test-Path ".\.gitignore") {
    Copy-Item -Force ".\.gitignore" $TargetDir
}

Write-Output @"
Инициализация завершена.

Следующие шаги:
1. Заполните docs/antora.yml: name, title и version.
2. Заполните docs/modules/ROOT/pages/architecture/overview.adoc.
3. Проверьте docs/modules/ROOT/nav.adoc.
4. Зарегистрируйте репозиторий в центральном antora-playbook.yml через start_path: docs.
5. Проверьте и сократите правила Cursor под проект.
"@
