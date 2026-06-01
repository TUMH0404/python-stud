@echo off
chcp 65001 > nul
setlocal

set "BASE_DIR=%~dp0"
set "VENV_DIR=%BASE_DIR%env"
set "PYTHON_CMD=python"

where py > nul 2>&1
if %errorlevel%==0 (
    set "PYTHON_CMD=py"
)

if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo 仮想環境を作成しています...
    %PYTHON_CMD% -m venv "%VENV_DIR%"
)

echo 仮想環境の準備が完了しました。
pause

endlocal
exit
