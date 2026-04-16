#!/bin/zsh
set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV_DIR="$BASE_DIR/env"

if [ ! -x "$VENV_DIR/bin/python" ]; then
  echo "仮想環境を作成しています..."
  python3 -m venv "$VENV_DIR"
fi

echo "仮想環境を有効化しています..."
source "$VENV_DIR/bin/activate"

echo "必要なライブラリを確認しています..."
python3 -m pip install --upgrade pip
python3 -m pip install -r "$BASE_DIR/requirements.txt"

export PYTHONSTARTUP="$BASE_DIR/history_repl.py"

echo "Pythonを起動します..."
python3
