@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ===================================
echo  Deploy - elonoferta
echo ===================================
echo.

git add -A
git commit --allow-empty -m "deploy %date% %time%"
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo [OK] Publicado com sucesso!
) else (
    echo.
    echo [ERR] Falha ao publicar. Execute as etapas abaixo:
    echo   gh auth login --hostname github.com --git-protocol https --web
    echo   Abra https://github.com/login/device e insira o codigo
    echo   Depois execute este script novamente.
)

pause
