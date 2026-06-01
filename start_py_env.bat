Set-Content -Path .\start_py_env.bat -Encoding ASCII -Value '@echo off
cd /d "%~dp0"

if not exist "env\Scripts\python.exe" (
    python -m venv env
)

pause
'
