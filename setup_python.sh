#!/bin/bash

USB_DIR="$(cd "$(dirname "$0")" && pwd)"
TARBALL="$USB_DIR/cpython-3.13.14+20260728-x86_64-unknown-linux-gnu-install_only.tar.gz"
URL="https://github.com/astral-sh/python-build-standalone/releases/download/20260728/cpython-3.13.14+20260728-x86_64-unknown-linux-gnu-install_only.tar.gz"

PYTHON_DIR="$USB_DIR/python-linux"
PYTHON_BIN="$PYTHON_DIR/python/bin/python3"

TMP_DIR="$(mktemp -d)"

if [ ! -f "$PYTHON_BIN" ]; then
    if [ ! -f "$TARBALL" ]; then
        echo "Downloading Python..."
        curl -L -o "$TARBALL" "$URL"
    fi

    echo "Extracting Python (temporarily, on local disk)..."
    tar -xzf "$TARBALL" -C "$TMP_DIR/"
    chmod +x "$TMP_DIR/python/bin/python3"

    echo "Copying to USB (resolving symlinks into real files)..."
    rm -rf "$PYTHON_DIR"
    mkdir -p "$PYTHON_DIR"
    cp -rL "$TMP_DIR/python" "$PYTHON_DIR/"

    echo "Cleaning up temporary files..."
    rm -rf "$TMP_DIR"

    echo "Upgrading pip..."
    "$PYTHON_BIN" -m pip install --upgrade pip
    echo "Installing libraries..."
    "$PYTHON_BIN" -m pip install pandas numpy matplotlib jupyterlab jupyterlab-language-pack-ja-jp
else
    echo "Already set up. Starting Jupyter Lab..."
fi

cd "$USB_DIR"
"$PYTHON_BIN" -m jupyter lab
