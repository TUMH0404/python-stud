#!/bin/bash

SETUP_DIR="$(cd "$(dirname "$0")" && pwd)"
TARBALL="$SETUP_DIR/cpython-3.13.14+20260728-aarch64-apple-darwin-install_only.tar.gz"
PYTHON_DIR="$SETUP_DIR/python-macos-arm64"
PYTHON_BIN="$PYTHON_DIR/python/bin/python3"
URL="https://github.com/astral-sh/python-build-standalone/releases/download/20260728/cpython-3.13.14+20260728-aarch64-apple-darwin-install_only.tar.gz"

if [ ! -f "$PYTHON_BIN" ]; then
    if [ ! -f "$TARBALL" ]; then
        echo "Downloading Python..."
        curl -L -o "$TARBALL" "$URL"
    fi
    echo "Extracting Python..."
    mkdir -p "$PYTHON_DIR"
    tar -xzf "$TARBALL" -C "$PYTHON_DIR/"
    xattr -dr com.apple.quarantine "$PYTHON_DIR/python"
    echo "Upgrading pip..."
    "$PYTHON_BIN" -m pip install --upgrade pip
    echo "Installing libraries..."
    "$PYTHON_BIN" -m pip install pandas numpy matplotlib jupyterlab jupyterlab-language-pack-ja-jp
else
    echo "Already set up. Starting Jupyter Lab..."
fi

"$PYTHON_BIN" -m jupyter lab
