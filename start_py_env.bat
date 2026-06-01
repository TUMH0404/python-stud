@echo off

if not exist "env\Scripts\python.exe" (
    python -m venv env
)

call env\Scripts\activate.bat

if not exist "main.py" (
    (
        echo # Created: %date% %time%
        echo.
        echo print("Hello Python")
    ) > main.py
)

python main.py

pause
