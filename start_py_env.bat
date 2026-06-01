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
