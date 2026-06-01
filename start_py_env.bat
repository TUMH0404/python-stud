@echo off

if not exist "env\Scripts\python.exe" (
    python -m venv env
)

call env\Scripts\activate.bat

for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyMMdd_HHmmss"') do set FILE=%%i_main.py

(
    echo # Created: %date% %time%
    echo.
    echo print("Hello Python")
) > "%FILE%"

echo Created: %FILE%

python "%FILE%"

pause
