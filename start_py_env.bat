@echo off

cd /d "%~dp0"

if not exist "env\Scripts\python.exe" (
    echo 仮想環境を作成しています...
    python -m venv env
) else (
    echo 仮想環境は既に存在します。
)

pause
