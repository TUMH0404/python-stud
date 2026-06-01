@echo off
chcp 65001 > nul

set "VENV_DIR=%~dp0env"

py -3.11 -V > nul 2>&1
if %errorlevel%==0 (
    set "PYTHON_CMD=py -3.11"
) else (
    set "PYTHON_CMD=python"
)

echo 仮想環境を作成しています...
%PYTHON_CMD% -m venv "%VENV_DIR%"

if errorlevel 1 (
    echo 仮想環境の作成に失敗しました。
) else (
    echo 仮想環境の作成が完了しました。
)

pause
