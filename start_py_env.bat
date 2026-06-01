@echo off
cd /d "%~dp0"

if not exist "env\Scripts\python.exe" (
    python -m venv env
)

pause
