@echo off
chcp 65001 > nul
setlocal

set "BASE_DIR=%~dp0"
set "VENV_DIR=%BASE_DIR%env"
set "REQ_FILE=%BASE_DIR%requirements.txt"
set "PYTHON_CMD=python"

where py > nul 2>&1
if %errorlevel%==0 (
    py -3.11 -V > nul 2>&1
    if %errorlevel%==0 (
        set "PYTHON_CMD=py -3.14"
    ) else (
        set "PYTHON_CMD=py"
    )
)

if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo 仮想環境を作成しています...
    %PYTHON_CMD% -m venv "%VENV_DIR%"
)

echo 仮想環境を有効化しています...
call "%VENV_DIR%\Scripts\activate.bat"


REM ===== 現在時刻取得 =====
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set DT=%%i

REM ===== Pythonファイル名 =====
set "PYFILE=%BASE_DIR%sample_%DT%.py"

REM ===== Pythonファイル作成 =====
echo print("Hello Python") > "%PYFILE%"

echo 作成されたPythonファイル:
echo %PYFILE%

cmd
