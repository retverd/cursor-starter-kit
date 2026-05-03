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
$docsDir = Join-Path $TargetDir "docs"

New-Item -ItemType Directory -Force -Path $cursorDir | Out-Null
New-Item -ItemType Directory -Force -Path $docsDir | Out-Null

Copy-Item -Recurse -Force ".\.cursor\rules" $cursorDir
Copy-Item -Recurse -Force ".\docs\architecture" $docsDir
Copy-Item -Recurse -Force ".\docs\components" $docsDir
Copy-Item -Recurse -Force ".\docs\workflows" $docsDir
Copy-Item -Recurse -Force ".\docs\templates" $docsDir

if (Test-Path ".\.gitignore") {
    Copy-Item -Force ".\.gitignore" $TargetDir
}

Write-Output @"
Инициализация завершена.

Следующие шаги:
1. Проверьте и сократите правила под проект.
2. Заполните docs/architecture/overview.md.
3. Заполните docs/components/*.
4. Адаптируйте glob-шаблоны под реальную структуру репозитория.
"@
