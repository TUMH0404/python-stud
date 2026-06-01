@echo off

if not exist "env\Scripts\python.exe" (
    python -m venv env
)

call env\Scripts\activate.bat

if not exist "main.py" (
    type nul > main.py
)

python main.py

pause
