@echo off
setlocal

set SETUP_DIR=%~dp0
set TARBALL=%SETUP_DIR%cpython-3.13.14+20260728-x86_64-pc-windows-msvc-install_only.tar.gz
set PYTHON_DIR=%SETUP_DIR%python-windows
set PYTHON_BIN=%PYTHON_DIR%\python\python.exe
set URL=https://github.com/astral-sh/python-build-standalone/releases/download/20260728/cpython-3.13.14+20260728-x86_64-pc-windows-msvc-install_only.tar.gz

if not exist "%PYTHON_BIN%" (
    if not exist "%TARBALL%" (
        echo Downloading Python...
        powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile '%TARBALL%'"
    )
    echo Extracting Python...
    mkdir "%PYTHON_DIR%"
    tar -xzf "%TARBALL%" -C "%PYTHON_DIR%"
    echo Upgrading pip...
    "%PYTHON_BIN%" -m pip install --upgrade pip
    echo Installing libraries...
    "%PYTHON_BIN%" -m pip install pandas numpy matplotlib jupyterlab jupyterlab-language-pack-ja-jp
) else (
    echo Already set up. Starting Jupyter Lab...
)

"%PYTHON_BIN%" -m jupyter lab